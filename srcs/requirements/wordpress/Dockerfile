# WORDPRESS Dockerfile
FROM debian:bullseye-20240408

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt-get install -y php-fpm php-mysql curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/wordpress_setup /run.sh

RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]