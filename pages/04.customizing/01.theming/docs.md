---
title: Theming
taxonomy:
    category:
        - docs
---

The custom theme system is using [laravel-theme](https://github.com/igaster/laravel-theme), which allows for great flexibility for creating themes, and extending existing ones, or only modifying the templates that you want to change.

## Creating a theme

!!! You can use `theme:create` command to bootstrap these steps

Into the root of the `resources/views/layouts` path, create a new folder, with a `theme.json` file. This JSON file serves as the manifest for your theme

```json
{
  "name"        : "THEME_NAME",
  "asset-path"  : "ASSET_PATH",
  "extends"     : "PARENT_THEME"
}
```

Important notes:

- **THEME_NAME** is the name of your theme. Can be any string.
- **ASSET_PATH** is relative to public path. You should create this folder too!
- **PARENT_THEME** is the name of the parent theme. Set it to `null` if this is a stand-alone theme. If you want to extend an existing theme, place that name there. You can extend the default template and change only the templates you want, by recreating the same structure for the template you want to override.
- You can add any additionaly configuration into the json file. You may access to your own settings with `Theme:getSetting('key')` & `Theme:setSetting('key','value')` at runtime.

### Assets in the public folder

While `laravel-theme` has a helper for the `theme_url`, in phpVMS, you should use the `public_asset()` helper function. Since phpVMS can run on both shared and on its own, the public folder path could be different. The `public_asset()` method takes care of that. It's recommended you create a new folder for your theme, under `public/assets`, and then referring to those assets like:

```php
echo public_asset('assets/my-theme/img/someimage.png');
```
---

## Layout Basics

- Layouts and templates follows [Laravel's Template Inheritance](https://laravel.com/docs/5.6/blade#template-inheritance)
- Your page layout needs to be called `app.blade.php`. This is to keep compatibility with any addons/modules that will extend the basic layout
  - All of the templates will `@extend('app')` as 
- The page layout requires several sections:
  - `@yield('title')` - this would go into the `<title>` tag of the page
  - `@yield('css')` - place this towards the end of the `<head>` section
  - `@include('system.scripts')` - put this last the last statement before the `</head>` tag
  - `@yield('content')` - where the body of the page will display
  - This goes at the end of the body:
    ```html
    <script src="{!! public_asset('/assets/system/js/vendor.js') !!}?v={!! time() !!}"></script>
    <script src="{!! public_asset('/assets/system/js/phpvms.js') !!}?v={!! time() !!}"></script>
    ```
  - `@yield('scripts')` has to go right before the `</body>` tag

See the `default/app.blade.php` as an example.

### Template basics

phpVMS takes advantage of many of the [Laravel Blade](https://laravel.com/docs/5.6/blade) features, and there are no limitations placed within the system to prevent anyone from using the full power of the templating system. There are only a few guidelines, to ensure a consistent standard for addons, widgets and other customizations.

- All templates extend the 'app' layout (as described above). Unless you have a custom page that has all of the HTML required
```php 
@extends('app')
```

- This is the page title, as described above
```php
@section('title', 'flights')
```

- This is where all of the content for a page will go
```php
@section('content')
# Place content here
@endsection
```

- This is also optional, where any CSS can go. Needs to include the `<style>` tags
```php
@section('css')
@endsection
```

- This is optional, where any Javascript will go. Needs to be in `<script>` tags
```php
@section('scripts')
@endsection
```

---

## More resources for themes

- The documentation for `laravel-theme` is great for more detailed tricks: [see the documentation here](https://github.com/igaster/laravel-theme/wiki/5.-Setting-the-active-theme)

