#!/bin/bash
ENV=./.env
ENV_EXAMPALE=./.env.example

#copy file ENV
if ! test -f "$ENV"; then
    cp ${ENV_EXAMPALE} ${ENV}
fi

source $ENV
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
PROJECT_DIR="$(dirname $(dirname $DIR))"
DOCKER_FILES="-f docker-compose.yml \
-f ./services/postgres.yml"
#-f ./services/mysql.yml"


# Create global network
docker network inspect "${APP_NAME}_network" &>/dev/null || docker network create --driver bridge "${APP_NAME}_network"
#run docker-compose
docker-compose $DOCKER_FILES "$@"
