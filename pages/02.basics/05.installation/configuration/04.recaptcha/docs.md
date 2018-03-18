---
title: Recaptcha
taxonomy:
    category:
        - docs
---

Recaptcha can be enabled, get the keys [here](https://www.google.com/recaptcha/admin). Then add/change the following to your `config.php` file. The section is there by default, just without the `sitekey` and `secret`.

```php
'captcha' => [
    'enabled' => true,

    'sitekey' => 'YOUR SITE KEY HERE',
    'secret' => 'YOUR SITE SECRET HERE',
],
```

You can also add additional attributes using the `attribute` key. See `config/captcha.php` to see details on what attributes you need to add to your `config.php` file.