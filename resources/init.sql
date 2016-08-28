ALTER TABLESPACE SYSTEM ADD DATAFILE '/u01/app/oracle/oradata/XE/system2.dbf' SIZE 10M AUTOEXTEND ON NEXT 200K MAXSIZE maxsizeplaceholder;

ALTER USER system identified by syspasswdplaceholder;
ALTER USER sys identified by syspasswdplaceholder;

alter profile DEFAULT limit password_life_time UNLIMITED;

grant create any directory to system;
create directory pump_directory as '/data/backup';
