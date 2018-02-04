#!/bin/bash

cd /var/www/docs.phpvms/
#chmod -R 0775 user

# Sync all of the docs with git
bin/plugin git-sync sync

# Download the CHANGELOG file and move it
wget https://raw.githubusercontent.com/nabeelio/phpvms/master/CHANGELOG.md -O /tmp/CHANGELOG.md
cp /tmp/CHANGELOG.md user/pages/changelog/default.md


