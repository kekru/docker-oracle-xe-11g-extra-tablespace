ALTER TABLESPACE SYSTEM ADD DATAFILE '/u01/app/oracle/oradata/XE/system2.dbf' SIZE 10M AUTOEXTEND ON NEXT 200K MAXSIZE maxsizeplaceholder;

ALTER USER system identified by syspasswdplaceholder;
ALTER USER sys identified by syspasswdplaceholder;

