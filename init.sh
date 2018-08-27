#!/usr/bin/env bash

rm /etc/nginx/sites-enabled/default
ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
/etc/init.d/nginx restart