FROM alpine:3.19

RUN apk update && \
	apk add mariadb mariadb-client
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/my.cnf.d/my.cnf
RUN mariadb-install-db
COPY ./tools/startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 3306
CMD [ "startup.sh" ]
