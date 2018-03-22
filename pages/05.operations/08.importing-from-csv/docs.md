---
title: 'Importing from CSV'
taxonomy:
    category:
        - docs
---

# Importing and Exporting Data

To make it easier to admin your VA, you can import and export different aspects to and from CSV. There also is a more complex, table-level importer/exporter available via command-line, which will export to YAML. 

General notes about the CSV files:

- Values must be comma-delimited
- Blank values are allowed for most fields, you'll see errors if they are omitted.
- Values can be surrounded by quotes, but they must be double quotes `"`. Single quotes will become a part of the value (you can use them in notes, for example)
- Multi-field values (described below) can be surrounded by quotes
- Where possible, some data will be automatically generated (e.g, the subfleets that are in an Aircraft import)
- Boolean values accept `0` (false) or `1` (true)



## Airports

### File Format

|Column | Type | Example | Notes
|------------ | ------------- | ------------- | -------------

| iata | string | | optional |

| icao | string | | required |

| name | string | | required |

| location | string | | optional |

| country | string | | optional |

| timezone | string | | optional |

| hub | bool | | optional, defaults to 0 (false) |

| lat | float | | Decimal latitude |

| lon | float | | Decimal longitude |





















