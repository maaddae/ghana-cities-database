# Ghana-Cities-Database
SQL dump of Ghana cities data containing regions and districts/municipals.

The project currently includes a core geographic dataset for Ghana with **16** regions and **260+** districts/municipals, plus a sample towns dataset for Greater Accra.

## Dataset overview

This repository is designed to be a lightweight source of Ghana administrative data for analytics, local apps, seed data, and educational projects.

### Included data files

- `src/sql/ghana_region_district_dump.sql` — MySQL dump with region and district records
- `src/csv/regions/regions.csv` — region list
- `src/csv/districts/districts.csv` — district list
- `src/csv/regions/regions_with_country.csv` — regions with country metadata
- `src/csv/districts/regions_districts.csv` — district-to-region linkage data
- `src/csv/towns/greater_accra/towns_with_region_country.csv` — sample towns data

## Recommended normalized schema

To make the dataset easier to use across SQL, Python, and frontend apps, the project now follows a clearer conceptual schema:

```text
region
- id: integer
- name: string
- country: string
- slug: string (recommended)

district
- id: integer
- name: string
- region_id: integer
- district_type: string (district, municipal, metropolitan)
- slug: string (recommended)

town
- id: integer
- name: string
- country: string
- region_id: integer
- district_id: integer (if available)
- latitude: float (recommended)
- longitude: float (recommended)
```

This structure keeps the repository easier to query and reduces inconsistencies when expanding beyond the existing datasets.

## Validation checklist

As the dataset grows, the following checks are recommended before publishing updates:

- no duplicate region names
- no duplicate district names within the same region
- all district `region_id` values must reference a valid region
- no trailing whitespace in names
- consistent capitalization across names
- country metadata should remain consistent across files
- town CSVs should use the same IDs and naming conventions as region and district datasets

## Recommended next add-ons

The following upgrades are safe, low-risk enhancements that do not change the meaning of the underlying data:

1. SQLite export for local querying without a MySQL setup
2. JSON export for app and frontend integrations
3. town coverage expansion beyond Greater Accra
4. a `data_dictionary.md` file describing each field and expected value
5. a `CHANGELOG.md` with versioned notes for data corrections and additions
6. a `sources.md` file documenting where each dataset came from and how it was validated

## Data provenance and release policy

For long-term maintainability, each published change should include:

- a clear source reference or citation
- a short description of what changed
- validation notes for duplicate checks and foreign-key integrity
- versioning for each major dataset refresh

This keeps the repository reliable as contributors add more counties, regions, towns, and related metadata.

## Example SQL queries

### List all regions

```sql
SELECT *
FROM region
ORDER BY id;
```

### Join districts by region

```sql
SELECT r.region_name, d.district_name
FROM region r
JOIN district d ON d.region_id = r.id
ORDER BY r.region_name, d.district_name;
```

### Count districts per region

```sql
SELECT r.region_name, COUNT(d.id) AS district_count
FROM region r
LEFT JOIN district d ON d.region_id = r.id
GROUP BY r.id, r.region_name
ORDER BY district_count DESC;
```

## Example Python usage

```python
import csv

with open('src/csv/regions/regions.csv', newline='', encoding='utf-8') as f:
    regions = list(csv.DictReader(f))

with open('src/csv/districts/districts.csv', newline='', encoding='utf-8') as f:
    districts = list(csv.DictReader(f))

print('Regions:', len(regions))
print('Districts:', len(districts))
```

## Example JavaScript usage

```js
const fs = require('fs');

const regions = fs.readFileSync('src/csv/regions/regions.csv', 'utf8');
const districts = fs.readFileSync('src/csv/districts/districts.csv', 'utf8');

console.log('Regions CSV loaded:', regions.split('\n').length - 1);
console.log('Districts CSV loaded:', districts.split('\n').length - 1);
```

## Samples

### REGIONS

| ID | REGION_NAME |
|:--:|:-----------:|
|  1 |   Ashanti   |
|  2 |   Ahafo     |
|  3 |   Bono East |

### DISTRICTS

| ID | ID_REGION |    DISTRICT/MUNICIPAL    |
|:--:|:---------:|:------------------------:|
|  1 |    2      |  Asunafo North Municipal |
|  2 |    2      |  Asunafo South District  |
|  3 |    2      |  Asutifi North District  |
|  4 |    2      |  Asutifi South District  |
|  5 |    2      |  Tano North Municipal    |


## Need help, have any questions, suggestions?

Submit an ***Issue*** or ***Pull Request***
