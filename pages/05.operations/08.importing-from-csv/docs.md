---
title: 'Importing from CSV'
taxonomy:
    category:
        - docs
---

[TOC]

To make it easier to admin your VA, you can import and export different aspects to and from CSV. There also is a more complex, table-level importer/exporter available via command-line, which will export to YAML. 

General notes about the CSV files:

- Values must be comma-delimited
- Blank values are allowed for most fields, you'll see errors if they are omitted.
- Values can be surrounded by quotes, but they must be double quotes `"`. Single quotes will become a part of the value (you can use them in notes, for example)
- Multi-field values (described below) can be surrounded by quotes
- Where possible, some data will be automatically generated (e.g, the subfleets that are in an Aircraft import)
- Boolean values accept `0` (false) or `1` (true)
- To get a CSV file, you can export it from the category that you want
- The header is required

#### Command line

Larger imports can be run from the command-line, using:

```bash
php artisan phpvms:csv-import {file path}
```



------

## Airports

| Column   | Example         | Notes                         |
| -------- | --------------- | ----------------------------- |
| iata     |                 | optional                      |
| icao     |                 | required                      |
| name     |                 | required                      |
| location |                 | optional                      |
| country  |                 | optional                      |
| timezone | America/Chicago | optional, TZ format           |
| hub      |                 | optional, defaults to `false` |
| lat      | 30.1945         | Decimal latitude              |
| lon      | -97.6699        | Decimal longitude             |

------

## Subfleets

| Column       | Example                 | Notes                                                        |
| ------------ | ----------------------- | ------------------------------------------------------------ |
| subfleet     | A32X                    | Required, the subfleet type. Created if it doesn't exist     |
| name         |                         | Required                                                     |
| registration |                         | Required                                                     |
| hex_code     |                         | Optional, ICAO hex ID                                        |
| status       |                         | See below. Defaults to `A` (Active)                          |
| fares        | `Y;F?price=100&cost=50` | Fares assigned to the subfleet, with the optional overrides. See [Multi-Value Fares](#fares-1) format. Optional |

### Statuses:

| Status Code | Description |
| ----------- | ----------- |
| A           | Active      |
| S           | Stored      |
| R           | Retired     |
| C           | Scrapped    |
| W           | Written Off |

------

## Fares

| Column   | Example    | Notes                           |
| -------- | ---------- | ------------------------------- |
| code     | `Y`        | Required, must be unique        |
| name     | required   |                                 |
| price    |            | What a passenger would pay      |
| cost     |            | What a seat costs you           |
| capacity |            | How many are in this fare class |
| notes    |            |                                 |
| active   | `0` or `1` | Boolean value, defaults to `1`  |

------

## Expenses

| Column         | Example    | Notes                                                       |
| -------------- | ---------- | ----------------------------------------------------------- |
| airline        | VMS        | The airline code. An airline is created if it doesn't exist |
| name           |            |                                                             |
| amount         |            | How much this expense is                                    |
| type           | F          | Type code, see below                                        |
| charge_to_user | `0` or `1` | Boolean, defaults to `0`                                    |
| multiplier     |            |                                                             |
| active         | `0` or `1` |                                                             |
| ref_class      |            | See below (optional)                                        |
| ref_class_id   |            | See below (optional)                                        |

### Expense Codes

| Code | Description |
| ---- | ----------- |
| F    | Per-Flight  |
| D    | Daily       |
| M    | Monthly     |

### Reference Classes

Since expenses can be applied to certain objects, you can also import them. For example, for `ref_class` if you put "Subfleet", and for `ref_class_id`, you enter `A32X`, the expense will be imported to that subfleet.

| Reference Class | ID                            |
| --------------- | ----------------------------- |
| Aircraft        | Use the aircraft registration |
| Airport         | Use the airport ICAO          |
| Subfleet        | Use the subfleet type         |

------

## Flight

| Column        | Example                                   | Notes                                                        |
| ------------- | ----------------------------------------- | ------------------------------------------------------------ |
| airline       | `VMS`                                     | The airline code. Created if it doesn't exist                |
| flight_number |                                           | Required                                                     |
| route_code    |                                           | Optional                                                     |
| route_leg     |                                           | Optional                                                     |
| dpt_airport   |                                           | Required, ICAO                                               |
| arr_airport   |                                           | Required, ICAO                                               |
| alt_airport   |                                           | Optional, ICAO                                               |
| days          | `0123456`                                 | 0 (Sunday) through 6 (Saturday)                              |
| dpt_time      | `0600 CST`                                | Departure time                                               |
| arr_time      |                                           | Arrival time                                                 |
| level         |                                           | Flight level                                                 |
| distance      |                                           | The flight distance in **nautical miles**                    |
| flight_time   |                                           | The flight time in **minutes**                               |
| flight_type   |                                           | See type codes below                                         |
| route         |                                           |                                                              |
| notes         |                                           |                                                              |
| active        | `0` or `1`                                | Boolean value                                                |
| subfleets     | `A32X;B74X`                               | Semicolon delimited list of  subfleet types                  |
| fares         | `Y;F?cost=800`                            | Fares assigned to the subfleet, with the optional overrides. See [Multi-Value Fares](#fares-1) format. Optional |
| fields        | ```"Departure Gate=4;Arrival Gate=C41"``` | Semicolon delimited list of key-value pairs to set as custom fields |

### Flight Type Codes

| Code | Description      |
| ---- | ---------------- |
| P    | Passenger Flight |
| C    | Cargo Flight     |
| H    | Charter flight   |



------



# Multivalue Entries



## Fares

Since fares in the Subfleet and Flight can have specific "overrides" as to the values, the way to express this in the CSV file is this:

```
[Fare Code 1]?[price=?]&[cost=?]&[capacity=?]; [Fare Code 2]
```

Where the fare code is the code, and then optionally:

- price
- cost
- capacity

If you don't want to override and just use the value from the main Fare, don't set that value; or if you don't want to set any of them, just enter the fare code. Some examples (these are limited to two, but you can chain as many as you'd like:

- Choose two fares: `Y;F`
- Choose one fare, but override the price on the second: `Y;F?price=500`
- Choose one, and override the price, and another override the capacity: `Y?price=200;F?capacity=10`
- Override the price on both: `Y?price=300;F?price=500`

