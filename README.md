# docker-verdaccio-s3
Private NPM container that can backup to s3

If the S3_BUCKET variable is supplied the container will sync content down upon starting, and perform a backup sync every 5 minutes.

If you do not supply the S3_BUCKET variable, the sync process will be ignored entirely

```
docker run --name verdaccio -e S3_BUCKET=<s3 bucket name> -p 80:4873 asynchrony/docker-verdaccio-s3 
```
