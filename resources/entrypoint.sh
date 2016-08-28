#!/bin/bash

sed -i "s|maxsizeplaceholder|$maxsize|g" /data/resources/init.sql
sed -i "s|syspasswdplaceholder|$syspasswd|g" /data/resources/init.sql
cp /data/resources/init.sql /docker-entrypoint-initdb.d/init.sql

/usr/sbin/startup.sh
