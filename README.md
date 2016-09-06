# Oracle XE 11g with extra tablespace
This is an Oracle XE 11g based on [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/) with an extra tablespace .dbf file.  

# Start Oracle:  
`docker run -d -p 1521:1521 whiledo/oracle-xe-11g-extra-tablespace`  

# Change tablespace
By default the extra tablespace's maximum is 16G. You can change it with the param `-e maxsize=8G`  
Example: `docker run -d -p 1521:1521 -e maxsize=8G whiledo/oracle-xe-11g-extra-tablespace`

# Enable SSH server
To start an SSH server, create a Dockerfile:
```
FROM whiledo/oracle-xe-11g-extra-tablespace
CMD /data/resources/entrypoint.sh && /usr/sbin/sshd -D
```
Create your image: `docker build -t myoracle .`  
And run: `docker run -d -p 1521:1521 -p 2222:22 myoracle`  


If you don't want a Dockerfile, you can run the container  
`docker run -d --name oracle123 -p 1521:1521 -p 2222:22 whiledo/oracle-xe-11g-extra-tablespace`  
Log in `docker exec -it oracle123 /bin/bash`  
Start the ssh server `/usr/sbin/sshd`  
And exit `exit`  

Now you can reach the SSH server via port 2222. For information on loginname and password see [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/).

# Create a backup
Mount /data/backup as a volume `-v <HostBackupDir>:/data/backup`.  
Backupfiles will be generated in /data/backup inside the container.  
Example: `docker run -d --name oracle123 -p 1521:1521 -v /home/me:/data/backup whiledo/oracle-xe-11g-extra-tablespace`  

Run `docker exec oracle123 /data/resources/orabackup.sh`  to create the backupfile via the `expdp` utility in `/home/me` on the hostcomputer.  

If you don't want to create a volume, you can also run `docker cp oracle123:/data/backup/ /home/me` to copy the backupfile to your hostcomputer.

# Restore a backup
The backupfile has to be in /data/backup/ inside the container.  
To import a backupfile put it in the volume (/home/me in the example under "Create a backup") or copy it in `/data/backup` inside the container with  
`docker cp /home/me/ORACLE-EXPDAT-2016-09-06_19-42-22.DMP oracle123:/data/backup/`  

Run the backup restore with  
`docker exec oracledb /data/resources/oraimport.sh ORACLE-EXPDAT-2016-09-06_19-42-22.DMP`  

# Define password
The default password for users sys and system is oracle. To set the password on startup, add `-e syspasswd=newpassword` to the docker run command.  
Example: `docker run -d -p 1521:1521 -e syspasswd=newpassword whiledo/oracle-xe-11g-extra-tablespace`  

# Set timezone  
To set a timezone for the container add `-e timezone="<your timezone>"` to the docker run command.  
Example: `docker run -d --name oracle123 -p 1521:1521 -e timezone="Europe/Berlin" whiledo/oracle-xe-11g-extra-tablespace`  

# More information
This image is based on [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/). You will find more information there.

Add `-e ORACLE_ALLOW_REMOTE=true` to the docker run command, if you want the database to be connected remotely.  
The default settings are
```  
hostname: localhost
port: 1521
sid: xe
username: system
password: oracle
```  
