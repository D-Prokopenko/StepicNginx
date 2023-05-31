sudo pip3 install virtualenv
sudo pip3 install pathlib2
virtualenv -p python3 venv
source venv/bin/activate
pip3 install django

sudo rm -rf /etc/nginx/sites-enabled/default

sudo ln -sf /home/box/StepicNginx/etc/nginx.conf  /etc/nginx/sites-enabled/nginx_2_1_11.conf

sudo /etc/init.d/nginx restart

gunicorn -w 2 -c /home/box/StepicNginx/etc/hello.py hello:app & gunicorn -w 2 -c /home/box/StepicNginx/etc/qa.py ask.wsgi:application & curl -vv 'http://127.0.0.1:8000/login/'