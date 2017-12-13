#!/bin/sh
/usr/bin/aws s3 sync /verdaccio s3://$S3_BUCKET --sse AES256 --delete --exclude storage/.sinopia-db.json
