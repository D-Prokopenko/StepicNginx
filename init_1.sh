sudo /etc/init.d/mysql start
mysql -uroot -e "create database curse;"
mysql -uroot -e "create user 'stepik'@'localhost' identified by 'curse';"
mysql -uroot -e "grant all privileges on  curse.* to 'curse'@'localhost'with grant option;"
python3 ~/web/ask/manage.py makemigrations qa
python3 ~/web/ask/manage.py migrate
