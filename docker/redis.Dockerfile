FROM redis:alpine
RUN chown -R redis:redis /etc
RUN chown -R redis:redis /var/lib/
RUN chown -R redis:redis /run

RUN #chmod 644 /data/dump.rdb
RUN chmod 755 /etc
RUN chmod 770 /var/lib/
RUN chmod 777 /run

#RUN mkdir -p /data/redis/{etc,data}
#RUN mkdir /data/redis/data/{bases,log}