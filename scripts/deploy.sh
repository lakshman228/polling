#!/usr/bin/env bash

# activate the virtual environment
source ~/env/bin/activate

# Cd into the project code
cd /var/www/polling

# pull the latest codebase
git pull

# install the app dependencies
pip install -r requirements.txt

# run the databse migration
python3 manage.py migrate

# run the collect static command
python3 manage.py collectstatic

# put all other commads that required for you specific app

# deactivate
deactivate

# reload nginx
sudo systemctl reload nginx

# restart the gunicorn
sudo systemctl restart gunicorn
