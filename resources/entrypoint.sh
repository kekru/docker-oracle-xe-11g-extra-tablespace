#!/bin/bash

sed -i "s|maxsizeplaceholder|$maxsize|g" /data/resources/init.sql
sed -i "s|syspasswdplaceholder|$syspasswd|g" /data/resources/init.sql
cp /data/resources/init.sql /docker-entrypoint-initdb.d/init.sql

#if $crontabbackup is not empty
if [ -n "$crontabbackup" ]; then
    #install cronjob for oracle backup script
    echo "$crontabbackup /data/resources/orabackup.sh" | crontab -
fi

/usr/sbin/startup.sh
