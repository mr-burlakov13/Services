FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add influxdb supervisor libc6-compat mysql mysql-client

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz

RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY ./supervisor.conf /etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/etc/telegraf.conf
COPY influxdb.conf /etc/influxdb.conf

COPY ./setup.sh ./
RUN chmod +x ./setup.sh

EXPOSE 8086
CMD sh setup.sh