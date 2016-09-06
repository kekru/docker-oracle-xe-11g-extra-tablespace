#!/bin/bash

sed -i "s|maxsizeplaceholder|$maxsize|g" /data/resources/init.sql
sed -i "s|syspasswdplaceholder|$syspasswd|g" /data/resources/init.sql
cp /data/resources/init.sql /docker-entrypoint-initdb.d/init.sql

#if $crontabbackup is not empty
if [ -n "$timezone" ]; then
   ln -snf /usr/share/zoneinfo/$timezone /etc/localtime
   echo "$timezone" > /etc/timezone
   dpkg-reconfigure -f noninteractive tzdata
fi

/usr/sbin/startup.sh
