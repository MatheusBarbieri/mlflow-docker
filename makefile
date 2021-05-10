export AWS_ACCESS_KEY_ID=somekey
export AWS_SECRET_ACCESS_KEY=sOmESeCrEt
export AWS_REGION=region
export AWS_BUCKET_NAME=mlflow
export MLFLOW_S3_ENDPOINT_URL=http://localhost:9000

export MYSQL_DATABASE=mlflow_db
export MYSQL_USER=mlflow_user
export MYSQL_PASSWORD=mlflow_password
export MYSQL_ROOT_PASSWORD=root
export MLFLOW_TRACKING_URI=http://localhost:5000

DOCKERFILES_FOLDER = ./mlflow_server

build-mlflow-server:
	docker-compose --f ${DOCKERFILES_FOLDER}/docker-compose.yml -- build

docker-mlflow-server: build-mlflow-server
	docker-compose --f ${DOCKERFILES_FOLDER}/docker-compose.yml -- up
