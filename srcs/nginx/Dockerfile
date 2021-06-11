FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor libc6-compat


COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./index.html /var/www
COPY ./supervisor.conf /etc/supervisord.conf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/lhayward.key \
-out /etc/ssl/lhayward.crt \
-subj "/C=ru/ST=rt/L=kazan/O=school21/CN=lhayward"

# RUN echo root:1111 | chpasswd
RUN adduser -D lhayward
RUN echo lhayward:lhayward | chpasswd
RUN chown -R lhayward:lhayward /var/lib/nginx
RUN chown -R lhayward:lhayward /var/www

COPY ./setup.sh ./

RUN chmod +x ./setup.sh

RUN mkdir -p /run/nginx

EXPOSE 80 443 22

CMD sh setup.sh