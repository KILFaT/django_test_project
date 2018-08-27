FROM ubuntu

RUN mkdir -p /home/box/web

WORKDIR /home/box/web/

ADD . /home/box/web/

EXPOSE 80

RUN apt-get update

RUN apt-get --assume-yes install nginx

RUN ./init.sh

CMD ["nginx", "-g", "daemon off;"]