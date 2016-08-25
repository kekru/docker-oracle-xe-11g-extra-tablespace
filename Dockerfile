FROM wnameless/oracle-xe-11g

ENV maxsize 16G

ADD resources /data/resources
RUN mkdir /docker-entrypoint-initdb.d \
 && chmod 777 /docker-entrypoint-initdb.d \
 && chmod -R 777 /data/resources

CMD /data/resources/entrypoint.sh && sleep infinity
