#!/bin/bash
set -x
set -e
PROJECT_NAME="rundeck"
LAUNCH_TYPE="FARGATE"
REGION="us-east-1"
PROFILE_NAME="rundeck"
LOADBALANCER_NAME="rundeck-ecs"
VPC_ID="vpc-xxxxxxxxxxxx"


# Compose up
ecs-cli compose --project-name ${PROJECT_NAME} \
--file docker-compose.yaml \
--ecs-params ecs-params.yml service up \
--private-dns-namespace ${PROJECT_NAME} \
--vpc ${VPC_ID} \
--target-group-arn <> \
--container-name nginx \
--container-port 80 \
--enable-service-discovery \
--launch-type ${LAUNCH_TYPE} \
--region ${REGION}


# Compose down
#ecs-cli compose --file docker-compose.yaml service down


# aws servicediscovery discover-instances \
# --namespace-name rundeck \
# --service-name rundeck \
# --query-parameters ECS_CLUSTER_NAME=RunDeck \
# --region us-east-1
