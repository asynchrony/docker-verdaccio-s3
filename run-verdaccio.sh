#!/bin/sh
set -e

if [ -n "$S3_BUCKET" ]; then
  echo "Setting up S3-Sync"
  chmod +x /usr/local/bin/s3-sync.sh
  touch /var/log/s3-sync.log

  echo "Doing initial sync with S3"
  /usr/bin/aws s3 sync s3://$S3_BUCKET /verdaccio

  echo "*/5 * * * * /usr/local/bin/s3-sync.sh > /var/log/s3-sync.log" | /usr/bin/crontab -
  echo "Ensure Crond is running in background"
  /usr/sbin/crond
fi

echo "Starting Verdaccio Server"
$APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $PROTOCOL://0.0.0.0:${PORT}
