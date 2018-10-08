FROM ubuntu

RUN mkdir -p /home/box/web

WORKDIR /home/box/web/

ADD . /home/box/web/

EXPOSE 80

RUN apt-get update

RUN apt-get --assume-yes install nginx

RUN apt-get --assume-yes install gunicorn

RUN apt-get --assume-yes install python3-pip

RUN apt-get --assume-yes install mysql

RUN pip3 install gunicorn

RUN pip3 install django

RUN ./init.sh

CMD ["nginx", "-g", "daemon off;"]