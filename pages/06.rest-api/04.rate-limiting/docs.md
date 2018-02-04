---
title: 'Rate Limiting'
---

[TOC]

Laravel's API Middleware includes a rate limiter, which, by default, it set to 60 requests per minute, per-IP.

## Response Code

If you exceed the throttling, you'll have a `429 Too Many Requests` HTTP response code. You'll also have a `Retry-After` header included, indicating the number of seconds to wait:

```http
Retry-After: 60
```

The below headers will also be included.

## Response Headers

When a request is made, several headers are returned to show you where you are in terms of throttling:

```http
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
```

## More Information

To read some more information about how the throttling works in Laravel, [check out this page](https://mattstauffer.com/blog/api-rate-limiting-in-laravel-5-2/)
