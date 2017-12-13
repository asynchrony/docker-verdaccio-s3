#!/bin/sh
/usr/bin/aws s3 sync /var/jenkins_home s3://$S3_BUCKET --sse AES256 --delete
