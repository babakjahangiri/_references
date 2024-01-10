#!/bin/bash
#eval $(keychain --eval --agents ssh --quiet key-name)

# Define variables

APP_NAME="<app_name>"
DOCKER_REGISTRY="<id>.dkr.ecr.eu-west-1.amazonaws.com/"$APP_NAME
REGION="eu-west-1"
ENV_FILE="/home/ec2user/.env"
PORT_MAPPING="8080:8080"
IMAGE=$DOCKER_REGISTRY":dev-latest"


#remove stop & running all containers 
docker ps -aq --filter "ancestor=$DOCKER_REGISTRY" | xargs -r docker rm

#remove all images
docker images $DOCKER_REGISTRY -q | xargs -r docker rmi
docker image prune -f

#login to aws ecr
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $DOCKER_REGISTRY 

# Pull the latest Docker image from AWS ECR
docker pull $IMAGE

# Run the Docker container with the latest image
docker run -d  --env-file $ENV_FILE -p $PORT_MAPPING $IMAGE #--name $APP_NAME

# Additional commands after updating the container
echo "Container updated. Performing additional setup..."
