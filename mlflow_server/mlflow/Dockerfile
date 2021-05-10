FROM continuumio/miniconda3:latest

RUN pip install mlflow==1.16.0 minio==7.0.3 boto3==1.17.68 pymysql==1.0.2

ADD . /app
WORKDIR /app

COPY ./scripts/. .
RUN chmod +x wait-for-it.sh
RUN chmod +x run.sh
