#!/usr/bin/env bash

rm /etc/nginx/sites-enabled/default
ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
#/etc/init.d/nginx restart
mkdir /etc/gunicorn.d
ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test.conf
#/etc/init.d/gunicorn restart
gunicorn -c /etc/gunicorn.d/test.conf hello:app &
echo "INIT DONE!"
