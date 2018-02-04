---
title: 'Layout Basics'
taxonomy:
    category:
        - docs
visible: true
---

[TOC]

phpVMS can customized to fit your VA's look and feel. The templating is powered by [Laravel Blade](https://laravel.com/docs/5.5/blade). To understand skinning and changing templates, study the Laravel Blade documents, and then the below will make more sense.

## Layout Basics

The main `app.blade.php` has 3 sections that are extended by the templates.

- `@section('title')` is the page title, and shows up in the title bar
- `@section('content')` is the main content for the page
- `@section('scripts')` is where any Javascript will go (note, you need to include the `<script></script>` tags when extending this section.

***

## Resources

A few good resources are:

- [Laravel Blade](https://laravel.com/docs/5.5/blade)
- [Blade 101, Laracast Video](https://laracasts.com/series/laravel-5-fundamentals/episodes/5)
- [Layouts and Structure, Laracast Video](https://laracasts.com/series/laravel-from-scratch-2017/episodes/10)

Laracasts is a great resource for learning the ins and outs of Laravel.
