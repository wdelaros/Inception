FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y php-fpm wget php-mysql mariadb-client

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh /script.sh
RUN chmod +x /script.sh

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT [ "/script.sh" ]