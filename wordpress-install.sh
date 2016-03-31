#!/bin/bash

$WORDPRESS_DIR=wordpress4_3

mkdir -p /var/www

cd /var/www
chown www-data:www-data /var/www -R

## la version 4.3 es por el momento la de trabajo
wget https://wordpress.org/wordpress-4.3.tar.gz

tar xzvf wordpress-4.3.tar.gz

mv wordpress $WORDPRESS_DIR

chown www-data:www-data $WORDPRESS_DIR -R