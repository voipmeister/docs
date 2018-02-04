---
title: 'Add-Ons & Modules'
taxonomy:
    category:
        - docs
---

[TOC]

If you're looking to create a full add-on, that has it's own URL, this is the page you want. If you want to create a component that someone can include into their own views/templates, you want a widget. 

At their core, the module system uses [laravel-modules](https://nwidart.com/laravel-modules/v2/introduction). The stubs are modified so the generation create the structure that is compatible with the phpVMS codebase.

***

## Basic Scaffold Generation

To generate a module, run:

```bash
php artisan module:make {ModuleName}
```

Which generates the basic structure in the `/modules` folder.

By default, routes will be prefixed with `ModuleName`. So if it's called `Bidding`, then routes will start with `/bidding`. A `/bidding/admin` is also added by default, and can be disabled/removed by editing the `modules/{ModuleName}/Http/routes.php` file.

***

## Automatic Installation

To be able to publish to composer, add `joshbrw/laravel-module-installer` as a dependency in your module's `composer.json` file, and then set the `type` in the `composer.json` file to `laravel-module`. Then a user can run `composer require your/module` from Packagist to install.

See [joshbrw/laravel-module-installer](https://github.com/joshbrw/laravel-module-installer) for additional information.

***

## Routing

Routing follows the standard Laravel routing format, and is placed in the `modules/{MODULE}/Http/routes.php` file. For examples, see the `app/Routes` files to see how the Route groups work and how the middleware works.

***

## Middleware

### Web Auth

Add one/both of these to your middleware:

```php
'middleware' => ['role:admin|user'],  # enable for all users
'middleware' => ['role:admin'], # enable for admin only
```

### API Auth
To enable API key authentication for REST-ful routes, add the `'api.auth'` middleware. The authenticated user is always available using:

***

## Getting the User

```php
$user = Auth::user();
```

To check if a user is logged in, use:

```php
if(Auth::check())
```

***

## Data Access

### Database

While you can use and import models directly, it's recommended to use the repositories, in the [app/Repositories](/nabeelio/phpvms/tree/master/app/Repositories) are listed [here](https://github.com/andersao/l5-repository#prettusrepositorycontractsrepositoryinterface). Repositories give the added benefits of automatically caching and flushing the cache when data is added/updated.

The recommended method is to use [Automatic Injection](https://laravel.com/docs/5.5/container#automatic-injection), which would involve adding a constructor to your Listener, as such:

```php
namespace Modules\Sample\Listeners;

use App\Events\PirepAccepted;
use App\Repositories\PirepRepository;

class PirepAcceptedListener {

    private $pirepRepo;

    // You can pass as many Repositories in as your wish. 
    // See the app\Controllers for more examples
    public function __construct(PirepRepository $pirepRepo) {
        $this->pirepRepo = $pirepRepo;
    }

    public function handle(PirepAccepted $pirep) {
        Log::info('Received PIREP', [$pirep]);
    }
}
```

The methods in the repositories largely mirror the Model methods, but can automatically handle searches, etc. The docs for the repositories [are available here](https://github.com/andersao/l5-repository#prettusrepositorycontractsrepositoryinterface). You can read more about the repository pattern [here](https://bosnadev.com/2015/03/07/using-repository-pattern-in-laravel-5/?utm_source=prettus-l5-repository&utm_medium=readme&utm_campaign=prettus-l5-repository)

***

## Models

The `handle()` methods of events are passed models, and repositories also return Model objects. See the [Laravel Model Documentation](https://laravel.com/docs/5.5/eloquent) for more details on how to work with models.

**Do not use SQL directly**

***

## Service Layer

When multiple models/repositories/steps are involved in a task, they should be written as a `Service` class. For example, when filing a PIREP,  there are changes made to the `PIREP` model, but also to the `User` model, one or more events are dispatched, etc. Instead of putting all of this logic into a Controller or directly into a Model, a Service class should be defined, which ties all these steps together. This helps with testing and debugging, and portability. In the PIREP example, it can be filed through a web interface, or a RESTful interface. A Service class allows for both of these to use the same logic without reusing code.

***

## Adding tables and migrations

TODO

***

## Templating

Templates are placed in `modules/{ModuleName}/Resources/views`. If someone wants to modify the views, it's recommended that they either run `php artisan vendor:publish` or they copy the templates into the `resources/views/module/$moduleName` folder (look at the `$viewPath` value in the `registerViews()` method in the `$MODULE/Providers/$ModuleServiceProvider.php` file for the exact path if you're unsure).

***

## Listening to events

Available events from the main app are listed in the [app/Events](/nabeelio/phpvms/tree/master/app/Events) directory. Subscribing to events follows the [Laravel Events](https://laravel.com/docs/5.5/events#event-subscribers) format. Create the event listener in your `$MODULE\Listeners` folder (e.g, `PirepAcceptedListener`), and then register it in your `$MODULE\Providers\EventServiceProvider` folder, in the `$listen` section, like:

```php
protected $listen = [
    'App\Events\PirepAccepted' => [
        'Modules\Sample\Listeners\PirepAcceptedListener',
    ],
];
```
To see the data passed, just look in the Event class.