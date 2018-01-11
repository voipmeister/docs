---
title: Configuration
taxonomy:
    category:
        - docs
visible: true
---

[TOC]

## The env.php File

After install, an `env.php` file is generated. This file is important to guard and protect, as it will contain your phpvms settings. For any basic configurations, to avoid needing to change any files in the `/config` directory, the values are first read from the `env.php` file.

Any additions to this file will be noted in the `CHANGELOG` file.

## Email

I recommend using a 3rd party service for sending email. They usually offer SMTP support, and great logging and analytics. Especially on a shared host, where email is locked down, and a "naughty neighbor" can quickly get the server/IP you're emailing from blacklisted.

The services I recommend and use:

* [Sparkpost](http://www.sparkpost.com) - Free up to 100k messages/month
* [Mailgun](http://www.mailgun.com) - Free, up to 10k messages/month


### Configuration
To configure email, in your `env.php` file, setup the following:

```
MAIL_DRIVER=smtp
MAIL_FROM_ADDRESS=[CHANGE]
MAIL_FROM_NAME="[CHANGE]"
MAIL_HOST=[ADDRESS]
MAIL_PORT=[PORT]
MAIL_ENCRYPTION=tls
MAIL_USERNAME=
MAIL_PASSWORD=
```

***

## Queue

If you're running your own server, you should also run a queue worker, which will further offload tasks from your requests. Emails and other background tasks utilize queues. 

`TBD`