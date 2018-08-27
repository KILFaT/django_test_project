#!/usr/bin/env bash

docker stop nginx1
docker rm nginx1
docker rmi nginx1
docker build -t nginx1 .
docker run -p 80:80 --name nginx1 -d nginx1
docker exec -it nginx1 /bin/bash