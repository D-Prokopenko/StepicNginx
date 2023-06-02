sudo pip3 install virtualenv
sudo pip3 install pathlib2
virtualenv -p python3 venv
source venv/bin/activate
pip3 install django

sudo rm -rf /etc/nginx/sites-enabled/default

sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/

sudo /etc/init.d/nginx restart

gunicorn -w 2 -c /home/box/web/etc/hello.py hello:app & gunicorn -w 2 -c /home/box/web/etc/qa.py ask.wsgi:application

sudo ~/web/ask/

sudo /etc/init.d/mysql start
mysql -uroot -e "create database curse;"
mysql -uroot -e "create user 'stepik'@'localhost' identified by 'curse';"
mysql -uroot -e "grant all privileges on  curse.* to 'curse'@'localhost'with grant option;"
python3 ~/web/ask/manage.py makemigrations qa
python3 ~/web/ask/manage.py migrate

