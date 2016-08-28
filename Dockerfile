FROM wnameless/oracle-xe-11g

RUN apt-get update && apt-get install -y \
    cron

ENV maxsize="16G" \
 syspasswd="oracle" \
 crontabbackup=""

ADD resources /data/resources
RUN mkdir /docker-entrypoint-initdb.d \
 && chmod 777 /docker-entrypoint-initdb.d \
 && chmod -R 777 /data/resources \
 && mkdir /data/backup \
 && chmod 666 /data/backup

CMD /data/resources/entrypoint.sh && sleep infinity
