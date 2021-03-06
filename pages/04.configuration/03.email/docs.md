---
title: Email
taxonomy:
    category:
        - docs
---

I recommend using a 3rd party service for sending email. They usually offer SMTP support, and great logging and analytics. Especially on a shared host, where email is locked down, and a "naughty neighbor" can quickly get the server/IP you're emailing from blacklisted.

The services I recommend and use:

* [Sparkpost](http://www.sparkpost.com) - Free up to 100k messages/month
* [Mailgun](http://www.mailgun.com) - Free, up to 10k messages/month


## Configuration
To configure email, in your `config.php` file, setup the following:

```php
'mail' => [
    'driver' => 'smtp',
    'host' => '',
    'port' => 587,
    'from' => [
        'name' => '',
        'address' => '',
    ],
    'username' => '',
    'password' => '',
],
```