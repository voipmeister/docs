---
title: Requirements
taxonomy:
    category:
        - docs
---

- PHP 7.0+, extensions:
  - cURL
  - JSON
  - mbstring
  - openssl
  - pdo
  - tokenizer
- Database:
  - MySQL (or MySQL variant, including MariaDB, Percona)
  - SQLite (for testing)
  - Postgres is supported by Laravel but not enabled/tested for phpVMS, yet
- Apache or Nginx
- Redis (optional, for job queuing, various optimizations)

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