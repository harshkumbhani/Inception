FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

COPY ./conf/mariadb.cnf /etc/my.cnf.d/my.cnf
COPY ./tools/startup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/startup.sh
RUN etc/init.d/mariadb setup

EXPOSE 3306
CMD [ "startup.sh" ]
