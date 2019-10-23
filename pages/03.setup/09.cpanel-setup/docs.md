---
title: 'Installation on cPanel'
---

# Download and Configure Files

## Method 1: phpvms directory (recommended)

Download/upload phpVMS into a `phpvms` folder in your home folder. It should look something like:

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

## Method 2: Upload into public_html

This method isn't recommended because it can potentially expose your install if the `.htaccess` or something isn't correctly configured. Upload the files directly into the `public_html` folder, and make sure the `.htaccess` file is active (check with your webhost)

---

# Database Setup

Log into your cPanel, and look for "MySQL Database Wizard":

![](Screen%20Shot%202019-10-23%20at%203.18.37%20PM.png)

Follow the wizard to generate a new database, user and password for the phpVMS Database


---

# Continue the Setup

Follow the instructions outlined here http://docs.phpvms.net/setup/installation#running-the-installer-1
