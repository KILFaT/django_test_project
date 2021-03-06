#!/usr/bin/env bash

#rm /etc/nginx/sites-enabled/default
#ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
##/etc/init.d/nginx restart
#mkdir /etc/gunicorn.d
#ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test.conf
#ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test.conf
##/etc/init.d/gunicorn restart
#gunicorn -c /etc/gunicorn.d/test.conf hello:app &
#cd /home/box/web/ask
#gunicorn -c /home/box/web/etc/django_gunicorn.conf ask.wsgi:application &

sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test-wsgi
sudo ln -sf /home/box/web/etc/django_gunicorn.conf /etc/gunicorn.d/test-django
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start
mysql -uroot -e "CREATE DATABASE qabase;"
mysql -uroot -e "CREATE USER 'qauser'@'localhost' IDENTIFIED BY '123456';"
mysql -uroot -e "GRANT ALL ON qabase.* TO 'qauser'@'localhost';"
cd ask/ask
./manage.py makemigrations qa
./manage.py migrate
echo "INIT DONE!"

# pacman -Syy && pacman -Syu
# sudo pacman -S mysql
#  pip install mysqlclient


