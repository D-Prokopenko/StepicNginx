sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/
sudo /etc/init.d/nginx restart

gunicorn -w 2 -c /home/box/web/etc/hello.py hello:app