#!/bin/bash
ENV=./.env
ENV_EXAMPALE=./.env.example

#copy file ENV
if ! test -f "$ENV"; then
    cp ${ENV_EXAMPALE} ${ENV}
fi

source $ENV

PRE_PUSH=./.git/hooks/pre-push
if ! test -L "$PRE_PUSH"; then
   echo "#### INIT FOR PHP-CI ############"
   ln -s ./pre-push-hooks.sh .git/hooks/pre-push
fi

MAKE_FILE=./Makefile
MAKE_FILE_SRC=src/Makefile
if ! test -f "MAKE_FILE_SRC"; then
  echo "#### INIT FOR PHP-CI ############"
  cp $MAKE_FILE $MAKE_FILE_SRC
fi

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
PROJECT_DIR="$(dirname $(dirname $DIR))"
DOCKER_FILES="-f docker-compose.yml \
-f ./services/postgres.yml"
#-f ./services/mysql.yml"
export PROJECT_DIR=$PROJECT_DIR
# Create global network
docker network inspect "${APP_NAME}_network" &>/dev/null || docker network create --driver bridge "${APP_NAME}_network"
#run docker-compose
docker-compose $DOCKER_FILES "$@"
docker exec -it "$APP_NAME"_php sh -c "sh ../php-ci/bin/initialize.sh"

