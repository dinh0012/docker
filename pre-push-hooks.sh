#!/bin/bash
# ln -s pre-push-hooks.sh .git/hooks/pre-push
ENV=./.env
source $ENV

result=`git stash -u`
if [ "${result}" = "No local changes to save" ] ;then
  pop=0;
else
  pop=1;
fi

# code checker
docker exec -i "$APP_NAME"_php sh -c "make check"
if [ $? -ne 0 ]; then
  if [ $pop -eq 1 ]; then
    git stash pop
  fi
  exit 1;
fi
# prepare testData + run unit test
docker exec -i "$APP_NAME"_php sh -c "make test"
if [ $? -ne 0 ]; then
  if [ $pop -eq 1 ]; then
    git stash pop
  fi
  exit 1;
fi

# Blackbox test by Cucumber


if [ $pop -eq 1 ]; then
  git stash pop
fi