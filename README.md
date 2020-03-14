# docker-verdaccio-s3

Private NPM container that can backup to s3

The container will sync content down upon starting, and perform a backup sync every 5 minutes. The EC2 instance running this container must have access to the S3 bucket via IAM Profile.

```
mkdir -p $PWD/verdaccio/storage $PWD/verdaccio/conf

# See https://verdaccio.org/docs/en/configuration for configuration.
# A sample configuration file has been included as config.yaml.template file, edit it

cp config.yaml.template $PWD/verdaccio/conf/config.yaml

docker run --name verdaccio -v $PWD/verdaccio/storage:/verdaccio/storage -v $PWD/verdaccio/conf:/verdaccio/conf -p 80:4873 asynchrony/docker-verdaccio-s3
```

## Running in AWS ECS Fargate

Two AWS CloudFormation stacks are provided within the `aws-cfn` directory to run this npm registry within an AWS ECS FARGATE cluster.

- `vpc.yml` Create a VPC to run the ECS cluster.
- `ecs.yml` The ECS cluster.
