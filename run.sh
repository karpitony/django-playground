#!/bin/bash

# DB migration
python manage.py migrate

# 필요하면 static collect
python manage.py collectstatic --noinput

# 앱 실행
uv run gunicorn config.wsgi:application --bind 0.0.0.0:8000

