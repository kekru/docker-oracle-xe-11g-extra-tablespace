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

# Make it persistent
To keep your oracle's data persistent on the host computer, mount `/u01/app/oracle/oradata/XE/` as a volume.  
Example: `docker run -d -p 1521:1521 -v /home/me:/u01/app/oracle/oradata/XE/ whiledo/oracle-xe-11g-extra-tablespace`  
This will store the tablespace files in /home/me on the host computer.

# More information
This image is based on [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/). You will find more information there.
