import csv
import os
from collections import Counter


DATA_FILES = {
    'regions': 'src/csv/regions/regions.csv',
    'districts': 'src/csv/districts/districts.csv',
    'towns': 'src/csv/towns/greater_accra/towns_with_region_country.csv',
}


def _read_csv(path):
    with open(path, newline='', encoding='utf-8') as f:
        return list(csv.DictReader(f))


def collect_dataset_stats(root_dir):
    stats = {}
    for key, rel_path in DATA_FILES.items():
        path = os.path.join(root_dir, rel_path)
        rows = _read_csv(path)
        stats[key] = len(rows)
    return stats


def get_normalized_schema():
    return {
        'region': ['id', 'name', 'country', 'slug'],
        'district': ['id', 'name', 'region_id', 'district_type', 'slug'],
        'town': ['id', 'name', 'country', 'region_id', 'district_id', 'latitude', 'longitude'],
    }


def validate_dataset(root_dir):
    issues = []

    for key, rel_path in DATA_FILES.items():
        path = os.path.join(root_dir, rel_path)
        rows = _read_csv(path)
        if not rows:
            issues.append({'file': rel_path, 'severity': 'critical', 'issue': 'No rows found'})
            continue

        lower_keys = {str(k).strip().lower(): k for k in rows[0].keys()}
        if 'id' not in lower_keys:
            issues.append({'file': rel_path, 'severity': 'critical', 'issue': 'Missing id column'})

        if 'name' not in lower_keys and 'districts' not in lower_keys and 'region' not in lower_keys:
            issues.append({'file': rel_path, 'severity': 'warning', 'issue': 'Could not find a standard name field'})

        ids = [row.get('id') or row.get('ID') for row in rows]
        duplicates = [item for item, count in Counter(ids).items() if count > 1]
        if duplicates:
            issues.append({'file': rel_path, 'severity': 'warning', 'issue': f'Duplicate ids detected: {duplicates[:5]}'} )

        whitespace_names = []
        for row in rows:
            for field_name in ('name', 'Districts', 'REGION'):
                value = row.get(field_name)
                if value is not None and value != value.strip():
                    whitespace_names.append(value)
                    break
        if whitespace_names:
            issues.append({'file': rel_path, 'severity': 'warning', 'issue': 'Found names with leading/trailing whitespace'})

    return issues


if __name__ == '__main__':
    root = os.path.dirname(os.path.dirname(__file__))
    print('stats=', collect_dataset_stats(root))
    print('schema=', get_normalized_schema())
    print('issues=', validate_dataset(root))
