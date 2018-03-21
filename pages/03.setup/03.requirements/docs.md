---
title: Requirements
taxonomy:
    category:
        - docs
---

## Server Requirements

One of the first steps in the installer is to check your server for the proper requirements.

- PHP 7.1 or up, extensions required:
  - cURL
  - JSON
  - mbstring
  - openssl
  - pdo
  - tokenizer
- Database:
  - MySQL 5.5+ (or MySQL variant, including MariaDB and Percona)
  - sqlite (if you want a test environment)

!!!! Why PHP 7.1 and above? The original phpVMS was written when PHP 5 was not as widespread, and it's turning 10 this year. PHP 7.0 was recently deprecated, and I want to write software that will last for the forseeable future

##### Optional

- [php-apc](http://php.net/manual/en/book.apc.php)
- [Redis](https://redis.io) (for job queuing, various caching and optimizations)

### VPS/Dedicated Hosts

If you have control over your server, the combination of nginx/php-fpm will offer you
the best performance, over using Apache. It's the combination I (@nabeelio) test with.
It will also be much more secure, seeing that only the `/public` directory is exposed.

Pointing the vhost to the `/public` directory is the best way to run on a host that you
control.

### Shared Hosting

While shared hosts are not ideal for numerous reasons (don't use free hosts, you'll have
a really bad time), it's still possible to run phpVMS. By just uploading the files, you
will be able to visit the site. Assuming your host is running Apache, the `.htaccess` file
should handle the URL rewriting. If you're unable to reach the installer (the first test
to see if it will work with your host), contact your host's support about `.htaccess`
support.