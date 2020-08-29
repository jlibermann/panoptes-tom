#!/usr/bin/env bash
set -e

echo "Waiting for postgres..."

while ! nc -z db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

python3 manage.py flush --no-input
python3 manage.py migrate

exec "$@"