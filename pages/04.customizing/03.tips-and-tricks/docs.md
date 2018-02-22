---
title: 'Tips and Tricks'
---

[TOC]

## References

- [Laravel Blade Template Documentation](https://laravel.com/docs/5.5/blade)
- [50 Laravel Tricks in 50 minutes](https://gist.github.com/cjthomp/1455c39d4a14292676ea)

## Get the logged in user

You can get the current user as:

```php
echo Auth::user()->name;
```

In a template, it's used like:

```php
{{ Auth::user()->name }}
```

In a template, it's best to wrap this around a check for if the user is logged in or not:

```php
@if(Auth::check())
    {{ Auth::user()->name }}
@endif
```

## Check if a value is filled/exists

If a value is not set, you might get an error, so one way of checking is to use the Laravel `filled()` helper:

```php
@if(filled($flight->flight_number))
    {{ $flight->flight_number }}
@endif
```