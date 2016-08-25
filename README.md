# Oracle XE 11g with an extra datafile
This is an Oracle XE 11g based on [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/) with an extra tablespace .dbf file.  

# Start Oracle:  
`docker run -d -p 1521:1521 whiledo/oracle`

By default the tablespace's maximum is 16G. You can change it with the param `-e maxsize=8G`  
Example: 
