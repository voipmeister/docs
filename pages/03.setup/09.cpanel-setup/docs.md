---
title: 'Installation on cPanel'
---

Configuration on cPanel

Download phpVMS into a `phpvms` folder in your home folder. It should look something like:

```
/home/youruser
  phpvms
  public_ftp
  public_html
```

To make this work properly and be secure, we're going to change the `public_html` directory to point into the phpVMS public directory. Then you can upload files as usual, but phpVMS will be the primary entry point. When you create folder/files in the `public_html` directory, they'll actually get created into the `phpvms/public` folder.

SSH into your server, and run:

```sh
mv public_html public_html_backup
ln -s phpvms/public/ public_html
```