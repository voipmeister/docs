#!/bin/bash

cd /var/www/docs.phpvms
#chmod -R 0775 user

# Sync all of the docs with git
sudo -u www-data bin/plugin git-sync sync

# Download the CHANGELOG file and move it
wget https://raw.githubusercontent.com/nabeelio/phpvms/master/CHANGELOG.md -O /tmp/CHANGELOG.md
cp /tmp/CHANGELOG.md /var/www/docs.phpvms/user/pages/changelog/default.md
chown www-data:www-data /var/www/docs.phpvms/user/pages/changelog/default.md
rm /tmp/CHANGELOG.md

sudo -u www-data bin/grav clear-cache
