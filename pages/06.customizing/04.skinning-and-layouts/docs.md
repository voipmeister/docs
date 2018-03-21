---
title: 'Skinning and Layouts'
taxonomy:
    category:
        - docs
visible: false
---

[TOC]

## Webpack and Compiling

NodeJS is required to compile assets. To recompile the assets, run:

```sh
npm run dev
```

***

## CSS and Templates

The main CSS files are stored in `public/assets/frontend/`. The main layout is stored in `app/layouts/default/app.blade.php`. 

The front-end templates and styling are built using Bootstrap, and using the [Now-UI Kit by Creative Tim](http://demos.creative-tim.com/now-ui-kit/index.html). Your custom styles can be added to the `public/assets/frontend/styles.css`.

You can, if you want, also remove Now-UI kit, and use your own CSS styling. Without Now-UI, it's just a basic shell that's using the Bootstrap framework.

### Paths

For your skin to work properly and be portable (if you want to make it publically available), the `public_asset()` needs to be used to refer to the path of something in the assets folder. Due to differences in how shared hosts and custom servers work, this call is required to wrap the correct base path.

```php
echo public_asset('/assets/frontend/img/logo.svg');
```

***

## Skins

Skins are stored in the `resources/layouts` directory. The default skin is called `default`. To create your own, the best way is to create a copy of `default`, and name it whatever you want. Then, to change the active skin, edit your `config.php` file, and edit the `skin` variable.

```php
'phpvms' => [
  'skin' => 'your-skin-folder',
],  
```

When you copy the layout, you'll need to edit the templates to change the `@extends('layouts.default.app')` calls in all of the templates to your skin name (e.g., if your skin folder is `mynewskin`, change all the @extends to `@extends('layouts.mynewskin.app')` (sorry, I know this sucks, but a find-replace in files in any editor should be able to do it really quickly without having to edit files)