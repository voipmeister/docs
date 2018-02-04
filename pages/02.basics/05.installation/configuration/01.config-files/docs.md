---
title: 'Config Files'
---

[TOC]

## config.php

A `config.php` file is also generated, with the database, mail, phpvms, etc settings. To be able to override any of the files in the `/config` directory, this file is used as an override (in the previous version of phpVMS, the `local.config.php` file is the same concept).

[Laravel configuration files](https://laravel.com/docs/5.5/configuration#accessing-configuration-values) are namespaced by the file names; in the `config.php` file, the root is set to the filename, and then the settings to override:

```php
return [
    # overrides app.php
    'app' => [
        'name' => 'phpvms',
        'url' => 'http://phpvms.test',

        # Don't forget to change these when live
        'env' => 'dev',
        'debug' => true,
    ]
];

# This is used as:

echo config('app.name'); 

# Outputs "phpvms"    
```

## env.php File

After install, an `env.php` file is generated. This file is important to guard and protect. Any additions to this file will be noted in the `CHANGELOG` file. While the base Laravel install uses this, most of the settings are placed into the `config.php`, although, you can still place any env variables in this file, the same as a standard Laravel install. This is the same as the Laravel `.env` file, but the extension changed and a guard placed to accomodate shared hosts.