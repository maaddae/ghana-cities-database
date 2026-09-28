# Sources and data provenance

This project is a structured reference dataset for Ghana administrative geography.

## Current data sources

- MySQL dump: `src/sql/ghana_region_district_dump.sql`
- Region CSV: `src/csv/regions/regions.csv`
- District CSV: `src/csv/districts/districts.csv`
- Town sample: `src/csv/towns/greater_accra/towns_with_region_country.csv`
- Country list: `src/csv/countries/countries.csv`
- Region-country mapping: `src/csv/regions/regions_with_country.csv`
- District-region mapping: `src/csv/districts/regions_districts.csv`

## Source notes

- The repository is intended as a lightweight, open-source geographic dataset.
- Existing data should be treated as a base reference set rather than a final canonical national registry.
- Added records and corrections should be documented with a short note describing the source and the update reason.

## Recommended contribution workflow

1. Verify the new data against an accepted source.
2. Keep field names consistent with the repository schema.
3. Run validation checks before publication.
4. Add a changelog note describing the update.
5. Reference the source in the commit or issue description.
