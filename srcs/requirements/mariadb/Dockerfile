# MariaDb Dockerfile
FROM debian:bullseye-20240408

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY ./conf/50-server.cnf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/my.cnf
COPY ./tools/mysql_setup /run.sh

RUN chmod +x /run.sh

CMD [ "/run.sh" ]