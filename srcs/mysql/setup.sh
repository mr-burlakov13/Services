#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < create_base
mysql -u root wordpress < wp.sql
rc-service mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf
