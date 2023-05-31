# gunicorn конфигурационный файл для hello.py

pythonpath = '/home/box/StepicNginx/'  # путь до приложения
bind = "0.0.0.0:8080"
workers = 4
