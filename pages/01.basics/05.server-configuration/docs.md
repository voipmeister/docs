---
title: 'Server Configuration'
taxonomy:
    category:
        - docs
---

[TOC]

## nginx 

The paths below will need to be changed to what's correct for your server. You also need to have `php-fpm` installed. 

```nginx
server {
  listen 80 default_server;
  listen [::]:80 default_server ipv6only=on;

  root /var/www/laravel/public;
  index index.php index.html index.htm;

  location / {
    try_files $uri $uri/ =404;
  }

  location ~ .php$ {
    fastcgi_pass   unix:/run/php/php7.1-fpm.sock;
    fastcgi_index  index.php;
    fastcgi_buffers 16 8k;
    fastcgi_buffer_size 16k;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        /etc/nginx/fastcgi_params;
  }

  location ~ /\.ht {
    deny all;
  }
}
```

## PHP APC

TBD

## Redis

TBD
