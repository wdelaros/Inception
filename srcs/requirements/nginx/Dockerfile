FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install openssl -y
RUN apt install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \ 
    -out /etc/ssl/certs/server.crt \
    -keyout /etc/ssl/private/server.key \
    -subj "/C=CA/ST=Quebec/L=Quebec/O=42/OU=inception/CN=wdelaros.42.fr"

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]