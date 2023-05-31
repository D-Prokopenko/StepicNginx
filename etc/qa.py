# gunicorn конфигурационный файл для hello.py

pythonpath = '/home/box/StepicNginx/ask/'  # путь до приложения django
bind = "0.0.0.0:8000"
workers = 4