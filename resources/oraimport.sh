#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: oraimport.sh file_to_import_within_data_backup.DMP"
    echo "example: oraimport.sh ORACLE-EXPDAT-2016-08-28_21-51-46.DMP"
    echo "where ORACLE-EXPDAT-2016-08-28_21-51-46.DMP is in /data/backup"
    exit 1
fi


if [ -z "$ORACLE_HOME" ]; then
    export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
    export PATH=$ORACLE_HOME/bin:$PATH
    export ORACLE_SID=XE
fi

impdp system/$syspasswd@localhost directory="pump_directory" dumpfile="$1"
