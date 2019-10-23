---
title: Installation
media_order: 'step7.png,step1.png,step2.png,step3.png,step4.png,step5.png,step6.png'
taxonomy:
    category:
        - docs
---

[TOC]

## Downloading

There are a few ways you can obtain phpVMS and its dependencies. The full package method already includes the `vendor` directory and you don't need to do anything but upload it.

#### Download Full Package

The tar file from the downloads site contains all of the dependencies. The versions available are:

- [Official releases and pre-releases](https://github.com/nabeelio/phpvms/releases) - The latest released versions
- [master, development branch](http://phpvms.net/downloads/phpvms-v7.0.0-master.tar.gz) - The latest commit, unstable

#### Composer

Coming Soon

#### Git Cloned or Github Download of Repository

After you SSH to your server, you can clone from Github, or download the ZIP that's offered by Github of the source, you have to run `composer install` in order for the dependencies and vendor data to be downloaded. 

```bash
git clone https://github.com/nabeelio/phpvms.git
cd phpvms
composer install
```

After running `composer install`, you can continue the directions below.

***

# Database Configuration

##### Create your database and credentials. 

Refer to your hosts documentation for specifics - the database name, username and password here are just examples, replace them with your own. This example is for MySQL:

```sql
CREATE DATABASE IF NOT EXISTS `phpvms` CHARACTER SET UTF8 COLLATE utf8_unicode_ci;
CREATE USER 'phpvms'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON phpvms.* TO 'phpvms'@'localhost';
FLUSH PRIVILEGES;
```

***

# Running the Installer

!!! There isn't a `setup` folder in the tar file. It's done as a Laravel route, which serves to see that your webserver/htaccess files are working correctly

Once you go to your site, you'll see a page like this, click to proceed to the installer.

![](step1.png?sizes=50vw)

After clicking next, you'll see the requirements check page. The installer will only let you proceeed if all of the requirements are met.

![](step2.png?sizes=50vw)

The next page brings you to the database setup page. 

- Enter the name of your site and the URL
- Enter your database credentials. 
  - You can test to make sure they're working by clicking the "Test Database Credentials" button.

![](step3.png?sizes=50vw)

After clicking "Setup Database", you'll see the installation screen. Hit next to proceed:

![](step4.png?sizes=50vw)

You'll be brought to the initial setup screen. Create your first airline here, along with your user and password. This will be automatically made as an admin user.

![](step5.png?sizes=50vw)

After setting that up, you'll see the completion screen, where you can click next and proceed to login. You'll see your dashboard after logging in, and the installation is complete!

![](step7.png?sizes=50vw)

### Next Steps

1. Read [about the configuration files](/basics/installation/configuration/config-files).
2. [Setup the cron task on your server](http://docs.phpvms.net/configuration/cron)
3. [Configure your mail server](http://docs.phpvms.net/configuration/email)
4. [Get Recaptcha working](http://docs.phpvms.net/configuration/recaptcha)

