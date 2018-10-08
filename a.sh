#!/usr/bin/env bash

docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:8
docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
docker stop nginx1
docker rm nginx1
docker rmi nginx1
docker build -t nginx1 .
docker run -p 80:80 --name nginx1 -d nginx1
docker exec -it nginx1 /bin/bash