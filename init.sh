sudo mv /home/box/StepicNginx/web ~
sudo ln -fs /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
gunicorn -w 2 -c /home/box/web/etc/hello.py hello:app