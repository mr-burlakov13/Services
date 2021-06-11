FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openrc openssl libc6-compat supervisor

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/lhayward.pem -out /etc/ssl/lhayward2.pem -subj "/C=ru/ST=rt/L=kazan/O=school21/CN=lhayward"
RUN printf "lhayward\nlhayward\n" | adduser lhayward -s /bin/false -h /lhayward

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY ./supervisor.conf /etc/supervisord.conf

RUN chown lhayward:lhayward /lhayward

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./setup.sh ./
RUN chmod +x ./setup.sh

EXPOSE 21 21000

CMD sh setup.sh