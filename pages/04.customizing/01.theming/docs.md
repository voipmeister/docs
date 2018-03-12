---
title: Theming
---

## Theming basics

The custom theme system was replaced with [laravel-theme](https://github.com/igaster/laravel-theme), which allows for greater flexibility for creating themes, and extending existing ones - and only being able to modify the themes that you want to update. A lot of this documentation is from `laravel-theme`, with some small changes.

## Creating a theme

!! You can use `theme:create` command to create a theme. These are the manual steps:

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

## More resources for themes

- The documentation for `laravel-theme` is great for more detailed tricks: [see the documentation here](https://github.com/igaster/laravel-theme/wiki/5.-Setting-the-active-theme)

