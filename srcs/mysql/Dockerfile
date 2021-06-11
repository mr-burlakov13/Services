FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add nginx mysql mysql-client openrc libc6-compat supervisor

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY ./supervisor.conf /etc/supervisord.conf

COPY my.cnf /etc/

COPY setup.sh .

COPY create_base .

COPY wp_db.sql .

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

RUN chmod +x setup.sh

CMD sh setup.sh
