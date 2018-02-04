---
title: Overview
taxonomy:
    category:
        - docs
---

[TOC]

phpVMS has a REST-api for integration with any standalone programs, including any flight simulator addons, or ACARS applications.

***

## Types

Not all IDs are numeric integers. At the moment, the primary keys on these tables are strings. They are hashed IDs that are generated:

* acars
* flights
* pireps

***

## Errors

Where possible, the standard HTTP error codes are followed and returned, with extra information in the body, if available.

### Unauthorized

`401` is returned if the API key is invalid, or the user is disallowed from API access. The `message` parameter will offer more error.

### Not Found

`404` is returned if an entity is not found

### Validation Errors

`400`, with details in the `message` parameter about the bad input.