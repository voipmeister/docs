---
title: 'Development Environment'
---

For development, copy the included `env.php.example` to `env.php` file. By default, it uses sqlite
instead of mysql. This makes it much easier to be able to clear the database and new fixtures.

The easiest way to load locally is to install [Laravel Valet](https://laravel.com/docs/5.5/valet) 
(if you're running a Mac). Once you install it, go to your phpvms directory, and run:

```bash
cp env.php.example env.php
php artisan key:generate
make install   # this will install everything
valet link phpvms
```

Now going to [http://phpvms.dev](http://phpvms.dev) should work. If you want to use mysql,
follow the valet directions on installing mysql (`brew install mysql`) and then update the
`env.php` file to point to the mysql.

The default username and password are "admin@phpvms.net" and "admin". 
To see the available users in the development environment, [see this file](https://github.com/nabeelio/phpvms/blob/master/database/seeds/dev.yml#L10) 

#### creating/resetting the environment

I use Makefiles to be able to quickly setup the environment.

```bash
# to do an initial setup of the composer deps and install the DB
make install
```

Then to reset the database/clear cache, use:

```bash
make reset
```

#### database seeding

There is a `database/seeds/dev.yml` which contains the initial seed data that can be used
for testing. For production use, there is a `prod.yml` file. The `make reset` handles seeding
the database with the data from the `dev.yml`.

## updating

extract files and run the migrations:

```bash
php artisan migrate
```

## Composer Access

run the following commands. for right now, we're running on sqlite. for mysql, set 
`DB_CONNECTION` to `mysql` in the `env.php` file.

```bash
cp env.php.example env.php
composer install --no-interaction
php artisan database:create
php artisan migrate:refresh --seed
```

then point your webserver to the `/public` folder.

By default, the Makefile calls the system-wide `composer`. If your host requires a 
certain path or name for composer, add `COMPOSER=` to the front of the `make` command, e.g:

```bash
COMPOSER=composer.phar make install
```