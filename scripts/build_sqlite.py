import csv
import os
import sqlite3

ROOT = os.path.dirname(os.path.dirname(__file__))
DB_PATH = os.path.join(ROOT, 'sqlite', 'ghana_locations.sqlite')


def read_csv(path):
    with open(path, newline='', encoding='utf-8') as f:
        return list(csv.DictReader(f))


def normalize_region(row):
    return {
        'id': int(row.get('id') or row.get('ID') or 0),
        'name': (row.get('name') or row.get('NAME') or '').strip(),
        'country': 'Ghana',
        'slug': (row.get('name') or row.get('NAME') or '').strip().lower().replace(' ', '-'),
    }


def normalize_district(row):
    region_id = row.get('Region ID') or row.get('region_id') or row.get('ID_REGION') or row.get('region')
    name = row.get('Districts') or row.get('district') or row.get('name') or row.get('DISTRICT') or ''
    return {
        'id': int(row.get('id') or row.get('ID') or 0),
        'name': str(name).strip(),
        'region_id': int(region_id) if str(region_id).strip() else 0,
        'district_type': 'district',
        'slug': str(name).strip().lower().replace(' ', '-'),
    }


def normalize_town(row):
    region = row.get('region') or row.get('Region') or row.get('region_id') or 0
    return {
        'id': int(row.get('id') or row.get('ID') or 0),
        'name': (row.get('name') or row.get('NAME') or '').strip(),
        'country': (row.get('country') or 'Ghana').strip() or 'Ghana',
        'region_id': int(region) if str(region).strip() else 0,
        'district_id': None,
        'latitude': None,
        'longitude': None,
    }


def build_db():
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    cur.execute('DROP TABLE IF EXISTS town')
    cur.execute('DROP TABLE IF EXISTS district')
    cur.execute('DROP TABLE IF EXISTS region')

    cur.execute('''
        CREATE TABLE region (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            country TEXT NOT NULL,
            slug TEXT NOT NULL
        )
    ''')

    cur.execute('''
        CREATE TABLE district (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            region_id INTEGER NOT NULL,
            district_type TEXT NOT NULL,
            slug TEXT NOT NULL,
            FOREIGN KEY(region_id) REFERENCES region(id)
        )
    ''')

    cur.execute('''
        CREATE TABLE town (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            country TEXT NOT NULL,
            region_id INTEGER NOT NULL,
            district_id INTEGER,
            latitude REAL,
            longitude REAL,
            FOREIGN KEY(region_id) REFERENCES region(id)
        )
    ''')

    regions = [normalize_region(r) for r in read_csv(os.path.join(ROOT, 'src/csv/regions/regions.csv'))]
    districts = [normalize_district(r) for r in read_csv(os.path.join(ROOT, 'src/csv/districts/districts.csv'))]
    towns = [normalize_town(r) for r in read_csv(os.path.join(ROOT, 'src/csv/towns/greater_accra/towns_with_region_country.csv'))]

    cur.executemany(
        'INSERT INTO region (id, name, country, slug) VALUES (?, ?, ?, ?)',
        [(r['id'], r['name'], r['country'], r['slug']) for r in regions],
    )
    cur.executemany(
        'INSERT INTO district (id, name, region_id, district_type, slug) VALUES (?, ?, ?, ?, ?)',
        [(d['id'], d['name'], d['region_id'], d['district_type'], d['slug']) for d in districts],
    )
    cur.executemany(
        'INSERT INTO town (id, name, country, region_id, district_id, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [(t['id'], t['name'], t['country'], t['region_id'], t['district_id'], t['latitude'], t['longitude']) for t in towns],
    )

    conn.commit()
    conn.close()
    print(f'Created SQLite database at {DB_PATH}')
    print(f'Regions={len(regions)}, Districts={len(districts)}, Towns={len(towns)}')


if __name__ == '__main__':
    build_db()
