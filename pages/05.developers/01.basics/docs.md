---
title: Basics
taxonomy:
    category:
        - docs
---

[TOC]

## Code Conventions

* [follow PSR1/PSR2 style guidelines](http://www.php-fig.org/psr/psr-2/)

***

## Code Layout

- I've tried to stick to the Laravel best-practices, unless absolutely unavoidable
- Data access is done through a `Repository` pattern/layer, in `App\Repositories`
- Business logic/rules that touch multiple Repositories and/or Models go into `Service` classes - `App\Services`

***

# Installing from scratch

To do an initial setup of the composer deps and install the DB

```bash
git clone https://github.com/nabeelio/phpvms.git
cd phpvms
make install
```

***

## Composer Access

By default, the Makefile calls the system-wide `composer`. If your host requires a 
certain path or name for composer, add `COMPOSER=` to the front of the `make` command, e.g:

```bash
COMPOSER=composer.phar make install
```

***

## Development environment using Valet

For development, copy the included `env.php.example` to `env.php` file. By 
default, it uses sqlite instead of mysql. This makes it much easier to be able 
to clear the database and new fixtures.

The easiest way to load locally is to install 
[Laravel Valet](https://laravel.com/docs/5.5/valet) (if you're running a Mac). 
Once you install it, go to your phpvms directory, and run:

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

***

## Resetting the environment

To reset the database/clear cache, use this command.

```bash
make reload-db
```

You can run the reload-db command as much as you want. If you log in using the default login (admin@phpvms.net), this won't log you out, it'll just reload the database with all the sample data (from `app/Database/seeds/sample.yml`)