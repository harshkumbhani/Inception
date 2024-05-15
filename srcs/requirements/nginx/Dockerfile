FROM alpine:3.19
RUN apk update && \
    apk add nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=DE/ST=Baden Wurttemberg/L=Heilbronn/O=42 Heilbronn/OU=CoreCurriculum students/CN=hkumbhan"
COPY ./conf/nginx.conf /etc/nginx/
# COPY ./conf/index.html /var/www/
EXPOSE 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
