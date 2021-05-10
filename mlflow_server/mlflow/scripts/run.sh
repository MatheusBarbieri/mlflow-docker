#!/bin/sh

./wait-for-it.sh artifact-store:9000 -t 60
./wait-for-it.sh backend_store:3306 -t 60

python create_bucket.py

mlflow server \
    --backend-store-uri mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@backend_store:3306/${MYSQL_DATABASE} \
    --default-artifact-root s3://${AWS_BUCKET_NAME}/ -h 0.0.0.0
