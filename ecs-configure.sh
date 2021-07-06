#!/bin/bash

set -e
set -x
PROFILE_NAME="rundeck"
CLUSTER_NAME="RunDeck"
REGION="us-east-1"
LAUNCH_TYPE="FARGATE"


ecs-cli configure --region "${REGION}" --cluster ${CLUSTER_NAME}  \
--config-name "$PROFILE_NAME" --default-launch-type ${LAUNCH_TYPE}


#ecs-cli configure --cluster "$CLUSTER_NAME" --default-launch-type "$LAUNCH_TYPE" \
#--region "$REGION" --config-name "$PROFILE_NAME"
