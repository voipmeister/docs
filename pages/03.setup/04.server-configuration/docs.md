---
title: 'Server Configuration'
taxonomy:
    category:
        - docs
---

[TOC]

# Shared Hosts

phpVMS can be run on a shared host, where you can't change the path of the home directory. Just uploading the phpVMS directory and navigating to it should work.

# Self Hosted

Either on a VPC or your own dedicated host is the best way to run phpVMS. As Laravel is designed, the `/public` directory is the directory that a vhost should be pointing to, since this is more secure. Having your own server will also allow you to setup a Redis queue and other optimizations to maximize your install's performance. Any serious VA that uses ACARS and other operations should be on a VPC.

## Resources

- [Deploying and Running a Laravel Application](https://www.digitalocean.com/community/tutorials/how-to-deploy-a-laravel-application-with-nginx-on-ubuntu-16-04)
- [Setting up nginx, PHP and Laravel (video tutorial)](https://serversforhackers.com/c/lemp-nginx-php-laravel)

## nginx 

The paths below will need to be changed to what's correct for your server. You also need to have `php-fpm` installed. See the [configuration file included with the nginx Docker config](https://github.com/nabeelio/phpvms/blob/dev/docker/nginx/default.conf)

```nginx
server {
    listen 80 default_server;
    server_name phpvms.test;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    root /var/www/public;
    index index.php index.html index.htm;

    location / {
         try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass app:9000; # THIS DEPENDS ON YOUR SERVER AND MIGHT NEED TO CHANGE
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include /etc/nginx/fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

