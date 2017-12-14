# docker-verdaccio-s3
Private NPM container that can backup to s3

The container will sync content down upon starting, and perform a backup sync every 5 minutes. The EC2 instance running this container must have access to the S3 bucket via IAM Profile.

```
docker run --name verdaccio -e S3_BUCKET=<s3 bucket name> -p 80:4873 asynchrony/docker-verdaccio-s3 
```
