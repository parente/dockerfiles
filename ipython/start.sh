#!/bin/bash

PEM_FILE=/notebook.pem

if [ ! -f "$PEM_FILE" ]; then
  openssl req -new -newkey rsa:1024 -days 365 -nodes -x509 \
    -subj "/C=XX/ST=XX/L=XX/O=generated/CN=generated" \
    -keyout $PEM_FILE -out $PEM_FILE
fi

if [ ! -z "$PASSWORD" ]; then
  # use password on notebook
  PHASH=$( python -c "from IPython.lib import passwd; print passwd('${PASSWORD}')" )
  echo "c.NotebookApp.password =u'${PHASH}'" >> /root/.ipython/profile_default/ipython_notebook_config.py
  unset PASSWORD
fi

ipython notebook --certfile=$PEM_FILE --ip='*'
