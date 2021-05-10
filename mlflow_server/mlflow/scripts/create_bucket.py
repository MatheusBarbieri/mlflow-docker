import os
import logging

from minio import Minio


access_key = os.environ.get('AWS_ACCESS_KEY_ID')
access_secret = os.environ.get('AWS_SECRET_ACCESS_KEY')
minio_endpoint = os.environ.get('MLFLOW_S3_ENDPOINT_URL')
bucket_name = os.environ.get('AWS_BUCKET_NAME')

minio_host = minio_endpoint.split('//')[1]
minioClient = Minio(
    minio_host,
    access_key=access_key,
    secret_key=access_secret,
    secure=False
)

bucket_exists = minioClient.bucket_exists(bucket_name)
print(f'Creating {bucket_name} bucket at {minio_endpoint}.')
if not bucket_exists:
    try:
        minioClient.make_bucket(bucket_name)
        print(f'{bucket_name} bucket created.')
    except Exception as e:
        logging.exception(f'Could not create {bucket_name} bucket at {minio_endpoint}', e)
else:
    print(f'Bucket {bucket_name} already exists.')
