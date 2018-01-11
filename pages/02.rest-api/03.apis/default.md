---
title: APIs
menu: 'APIs Available'
---

[TOC]

## User APIs

### GET /api/user

Returns the user's information, including bids, etc. Example response:

```json
{
   "id":2,
   "name":"Adam Lockman PhD",
   "email":"miles.sporer@example.net",
   "apikey":null,
   "rank_id":"1",
   "home_airport": "KJFK",
   "curr_airport": "KJFK",
   "last_pirep_id": 1,
   "flights":0,
   "flight_time":914,
   "balance":0,
   "timezone": "American/Chicago",
   "status":0,
   "state":1,
   "airline":{
      "id":1,
      "icao":"VMS",
      "iata":"VMS",
      "name":"phpVMS Airlines",
      "country":"United States",
      "logo":null
   },
   "bids":[

   ],
   "rank":{
      "name":"New Pilot",
      "subfleets":[

      ]
   }
}
```

***

### GET /api/user/fleet

This returns the subfleets and aircraft that this user's rank gives them access to.

```json
[
    {
        "id":1,
        "airline_id":1,
        "name":"Boeing 747-400",
        "type":"B744",
        "fuel_type":null,
        "cargo_capacity":null,
        "fuel_capacity":null,
        "gross_weight":null,
        "aircraft":[
        {
            "id":1,
            "subfleet_id":"1",
            "icao":"B744",
            "airport_id":"KJFK",
            "hex_code":null,
            "name":"Boeing 747 \"The Queen\"",
            "registration":"NC17",
            "tail_number":"17",
            "active":true,
            "created_at":"2018-01-08 21:37:13",
            "updated_at":"2018-01-08 21:37:13"
        }
        ]
    }
]
```