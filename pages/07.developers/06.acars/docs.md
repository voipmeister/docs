---
title: ACARS
taxonomy:
    category:
        - docs
visible: true
---

[TOC]

The procedure for ACARS applications has changed in this version of phpVMS, bringing several new features:

- All ACARS data is now tied to a PIREP
- Any updates provided by an ACARS application are all saved as history, viewable with a PIREP
- ACARS data can be retrieved

All ACARS API calls are done with the user's API key ([see the REST Interface page](https://github.com/nabeelio/phpvms/wiki/REST-Interface)) The procedure for ACARS roughly is:

1. `POST` the `/api/pireps/prefile` with some of the PIREP planned information. It will return an `id` for the PIREP
2. `POST` ACARS data updates to `/api/pireps/{PIREP_ID}/acars/positions`
3. `POST` ACARS event updates to `/api/pireps/{PIREP_ID}/acars/events` (optional)
4. File the PIREP, a POST to `/api/pireps/{PIREP_ID}/file`, passing in any of the PIREP information to be updated and the final information.

The route is displayed, with an example of the body JSON below it. The code for the API code, for reference, is all located in `\App\Http\Controllers\Api\PirepController`

!!! All units passed in must be in imperial units

------

## Virtual Airline Settings

To get the settings for a VA, like the units they use for distance, etc.

```http
GET /api/settings
```

------

## Prefile

Before you can file a PIREP or add any ACARS/route data, a prefile must be completed so you can get a PIREP ID to attach the information to. The user the PIREP is for is automatically determined through the API key. Optional fields are marked as such.

- Required fields
  - `airline_id`
  - `aircraft_id`
  - `flight_number`
  - `dpt_airport_id`
  - `arr_airport_id`
  - `source_name`
- `flight_type`:
  - `0` for Passenger
  - `1` for Cargo
  - `2` for Charter
- `planned_flight_time` must be in **minutes**
  - While this field isn't required, it's advantageous to add it. It can enable stats to be run on actual vs planned flight times, and progress bars, etc.
- (Optional) A `fields` object can be passed which is an arbitrary key-value dictionary. Subsequent updates to the fields are merged, with the same keys being overwritten.
- (Optional) A `fares` object is a list of objects, with the fare ID, and the count of passengers or proper unit for what's in that fare. It can be updated in the update/file routes, however, you must pass *all* of the fares, since it'll be overwritten. The fares can be found from the subfleet of the aircraft

```http
POST /api/pireps/prefile
```

Sample Request:

```json
{
   "airline_id": 1,
   "aircraft_id": 1,
   "flight_number": 223,
   "route_code": A,
   "route_leg": 1,
   "dpt_airport_id": "KAUS",
   "arr_airport_id": "KJFK",
   "gross_weight": 73000,
   "level": 370,
   "planned_distance": 1639,
   "planned_flight_time": 239,
   "route": "ILEXY1 JESSO LFK AEX MEI ATL FIGEY Q64 TYI ORF J121 SIE CAMRN4",
   "source_name": "ACARS",
   "flight_type": 0,
   "fields": {
   	  "transponder": "4567",
      "taxi_time": "0h5m"
   },
   "fares": [
      [
		"id": "FARE ID",
    	"count": "Number in this fare",
	  ],
   ]
}
```

------

## PIREP Update

If you want to update any of the fields for a PIREP, you can use this call.

- `flight_time` and `planned_flight_time` must be in **minutes**
- `block_off_time` should be updated on pushback - in UTC
- `block_on_time` should be updated on gate/parking arrival - in UTC

```http
POST /api/pireps/{ID}/update
```

Sample Request:

```json
{
   "planned_flight_time": 239
}
```

------

## File Route

After a PIREP has been prefiled, you can also set the route for the PIREP. These route navpoints don't need to exist or be imported server-side (e.g, updating the nav database), since the coordinates are also stored. 

- `route` is a list of objects, where each is a nav-point. 
- `nav_type` is optional. 
- `order` needs to be set, which ensures it's drawn correctly on any maps.

```http
POST /api/pireps/{PIREP ID}/route
```

Sample Request:

```json
{
	"route": [
		{
		   "name":        CARIN,
		   "order":       1,
		   "nav_type":    1,
		   "lat":         -37.024312,
		   "lon":         53.297282
		}
	]
}
```

To erase the route, a DELETE call can be made. This can be used there's an update to the scheduled route or change

```http
DELETE /api/pireps/{PIREP ID}/route
```

------

## ACARS Position Updates

ACARS position updates are provided as a list of objects. You can provide one, or many as a batch update. A position update can also include a log message (see next section).

- `created_at` is optional, the current time in UTC will be used. If you're providing multiple position updates, however, you should set the `created_at` field, so all the waypoints aren't marked as being reached at the same time.
- `log` is optional, there is a separate endpoint for sending log messages

```http
POST /api/pireps/{PIREP ID}/acars/position
```

Sample Request:

```json
{
	"positions": [
		{
		   "lat":         -37.024312,
		   "lon":         53.297282,
		   "heading":     45,
		   "altitude":    270,
		   "vs":          0,
		   "gs":          519,
		   "transponder": 2240,
		   "autopilot":   "VNAV LNAV",
		   "sim_time":    "1452Z",
		   "created_at":  "2018-01-30T14:52:11+00:00"
		}
	]
}
```

You can also retrieve all of the position updates, in case you want to reconcile. Each waypoint is assigned an ID.

```http
GET /api/pireps/{PIREP ID}/acars/position
```

------

## ACARS Event Updates

A log is generally an action message, like "Flaps lowered 0 to 10" or "VNAV activated", etc. Log updates are provided as a list of objects. You can provide one, or many as a batch update. While these log/event messages can be included with a position update, when sent as an event, they're saved as a special type in the `acars` table, and are displayed separate from the main ACARS map, as a separate table. These can also be supplied special icons on the ACARS map.

- Required Fields:
  - `event`

The `lat`, `lon`, and `created_at` are optional.

```http
POST /api/pireps/{PIREP ID}/acars/events
```

Sample Request:

```json
{
	"events": [
		{
		   "event":       "Gear Up",
		   "lat":         -37.024312,
		   "lon":         53.297282,
		   "created_at":  "2018-01-30T14:52:11+00:00"
		}
	]
}
```

------

## File PIREP

This is the final step for a PIREP. All fields, except for the `flight_time` are optional. If other fields are supplied, they'll be updated in the PIREP. Optional fields are marked as such.

- Required fields:
  - `distance` - in **miles**
  - `flight_time` - in **minutes**
  - `fuel_used` - in **lbs**
- `block_time` isn't required, but is encouraged. Must be in **minutes**
- `block_off_time` should be updated on pushback - in UTC
- `block_on_time` should be updated on gate/parking arrival - in UTC
- A `fields` object can be passed which is an arbitrary key-value dictionary

```http
POST /api/pireps/{PIREP ID}/file
```

Sample Request:

```json
{
   	"flight_time": 202,
   	"fuel_used": 12000,
   	"distance": 1639,
   	"landing_rate": -167,
   	"level": 330,
   	"fields" {
    	"transponder": "4567",
    	"taxi_time": "0h5m"
	}
}
```

------

## PIREP Comments

This adds a comment to the PIREP, visible by an admin. You don't need to have filed the PIREP to add a comment.

```http
POST /api/pireps/{PIREP ID}/comments
```

Sample Request:

```json
{
   "comment": "COMMENT TO ADD"
}
```

To retrieve the comments, use the `GET` call:

```http
GET /api/pireps/{PIREP ID}/comments
```

------