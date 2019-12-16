#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ./.env
SCRIPT=`readlink -f $0`
DIR=`dirname $SCRIPT`
PROJECT_DIR="$(dirname $(dirname $DIR))"
DOCKER_FILES="-f docker-compose.yml"

# Create global network
docker network inspect "${APP_NAME}_network" &>/dev/null || docker network create --driver bridge "${APP_NAME}_network"

export PROJECT_DIR=$PROJECT_DIR

#run docker-compose
docker-compose $DOCKER_FILES $@
