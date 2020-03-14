#!/bin/sh
set -e

if [ -n "$S3_BUCKET" ]; then
  echo "Setting up S3-Sync"
  touch /var/log/s3-sync.log

  echo "Doing initial sync with S3"
  /usr/bin/aws s3 sync s3://$S3_BUCKET /verdaccio
  echo "Changing file permissions to verdaccio user"
  chown -R verdaccio /verdaccio

  echo "*/5 * * * * /usr/local/bin/s3-sync.sh > /var/log/s3-sync.log" | /usr/bin/crontab -
  echo "Ensure Crond is running in background"
  /usr/sbin/crond
fi

echo "Starting Verdaccio Server"
su -s "/bin/sh" -c "$VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:${VERDACCIO_PORT}" "verdaccio"
