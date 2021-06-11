FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor wget php-fpm openrc php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session libc6-compat

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.16.2_linux_amd64.tar.gz
RUN mv telegraf-1.16.2 /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xvf latest-ru_RU.tar.gz
RUN rm -rf latest-ru_RU.tar.gz

RUN mv wordpress ./var/www/
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./wp-config.php ./var/www/wordpress/

COPY ./setup.sh ./
RUN chmod +x ./setup.sh

RUN mkdir -p /run/nginx

EXPOSE 5050

CMD sh setup.sh