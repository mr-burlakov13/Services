FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget libc6-compat supervisor

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.1.linux-amd64.tar.gz
COPY ./supervisor.conf /etc/supervisord.conf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY telegraf.conf /etc/telegraf/etc/telegraf.conf

RUN mv grafana-7.4.1 grafana
RUN rm grafana-7.4.1.linux-amd64.tar.gz

COPY ./grafana.db ./grafana/data/grafana.db

COPY ./setup.sh ./
RUN chmod +x ./setup.sh

EXPOSE 3000
CMD sh setup.sh