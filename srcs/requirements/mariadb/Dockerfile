FROM debian:oldstable

RUN apt update && apt upgrade -y && apt-get install mariadb-server -y


COPY tools/script.sh script.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x /script.sh

RUN chmod 600 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "/script.sh" ]