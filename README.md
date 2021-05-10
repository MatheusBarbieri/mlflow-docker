# MlFlow Docker

This is a simple docker setup to run mlflow server with a object store and a metrics backend

## Running
There is a makefile rule `docker-mlflow-server` that builds and start the containers.

After starting, mlflow-ui should be available on http://localhost:5000 and object storage at http://localhost:9000
