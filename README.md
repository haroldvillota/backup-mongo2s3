# Backup MongoDb to S3 AWS Bucket

This script create a dump for one or many mongodb databases and upload it to a S3 AWS Bucket

## Requirements

- A valid connection to a MongoDb Server and one valid user permision to dump the databases
- Valid credentials to write the S3 AWS Bucket

## Environment

- MONGO_DATABASES=DATABASE1,DATABASE2,DATABASE3
- MONGODB_CONNECTION=mongodb://USER:PASSWORD@HOST:PORT/
- S3_BACKUPS_BUCKET=s3://BUCKETNAME/BACKUP_DIRECTORY/
- AWS_ACCESS_KEY_ID=MY_AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY=MY_AWS_SECRET_ACCESS_KEY