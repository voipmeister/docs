---
title: 'Code Notes'
taxonomy:
    category:
        - docs
---

[TOC]

## Notes

#### Elapsed Time

All elapsed times should be stored in minutes. The `Utils` Facade class has multiple helper functions:

```php
use Utils;

# Minutes to hours min
$hm = Utils::minutesToTimeParts(65);

# Returns:
[
	'h' => 1,
  	'm' => 5,
]

echo Utils::minutesToTimeString(65);
# Outputs 1h 5m
```

If your add-on tracks any sort of times, the column should be a `UNSIGNED BIG INT`, or in the migrations:

```php
Schema::create('aircraft', function (Blueprint $table) {
	$table->unsignedBigInteger('hours')->nullable()->default(0);
});
```

***

## Helpers

Helpers are functions that are accessible globally. While Laravel comes with a [large number of helpers](https://laravel.com/docs/5.5/helpers#available-methods), and it's worth looking through the list, there are numerous helpers that have been added for phpVMS.


### Render a Template From Current Skin

By default the built-in Laravel `view()` call will refer from the base path of the `resources/views` directory. Use the `skin_view()` helper to set the base path to the current skin, e.g: `resources/views/layouts/{skin}`

```php
# This will look for the template file in resources/views/layouts/default/flights/index
echo skin_view('flights/index`);
```

### Date/Time Functions

There is a helper function called `show_date()` and `show_datetime()`, which will convert any dates and times into the user's local format, defaulting to UTC. All dates are stored in the database in UTC format. The standard dates/times are kept in two columns: `created_at` and `updated_at`. 

```php
echo show_datetime($user->created_at);
```

_See [Laravel Date Mutators](https://laravel.com/docs/5.5/eloquent-mutators#date-mutators)_

### Settings

To read a setting from the settings table, use the `setting()` helper:

```php
echo setting('general.start_date');
```

While the settings are referred to in a dotted format, they're stored with all underscores in the database. See [Settings]()