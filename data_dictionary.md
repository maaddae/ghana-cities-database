# Data dictionary

This document describes the core fields used in the project and the recommended conventions for future additions.

## Region

| Field | Type | Description | Example |
| --- | --- | --- | --- |
| id | integer | Unique region identifier | 1 |
| name | string | Region name | Ashanti |
| country | string | Country name | Ghana |
| slug | string | URL-safe region name for apps and APIs | ashanti |

## District

| Field | Type | Description | Example |
| --- | --- | --- | --- |
| id | integer | Unique district identifier | 12 |
| name | string | District name | Bekwai Municipal |
| region_id | integer | Foreign key to the region table | 1 |
| district_type | string | Administrative type such as district, municipal, or metropolitan | municipal |
| slug | string | URL-safe district name for apps and APIs | bekwai-municipal |

## Town

| Field | Type | Description | Example |
| --- | --- | --- | --- |
| id | integer | Unique town identifier | 301 |
| name | string | Town or settlement name | Kanda |
| country | string | Country name | Ghana |
| region_id | integer | Region foreign key | 55 |
| district_id | integer | District foreign key when available | null |
| latitude | float | Latitude value in decimal degrees | 5.6 |
| longitude | float | Longitude value in decimal degrees | -0.17 |

## Validation conventions

- IDs should be unique within their table.
- Names should be trimmed and consistently capitalized.
- `region_id` and `district_id` values should reference valid records.
- `slug` values should be lowercase and hyphenated.
- New files should follow the same naming and field conventions as the existing CSV exports.
