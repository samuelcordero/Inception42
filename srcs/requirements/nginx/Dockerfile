FROM debian:bullseye-20240408


RUN apt -y update && apt install -y nginx && apt install openssl -y




COPY ./conf/conf /etc/nginx/sites-available/

COPY ./tools/nginx_setup /run.sh

RUN chmod +x /run.sh

CMD [ "/run.sh" ]