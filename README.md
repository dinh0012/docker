# docker
./run.sh up

# initial test
docker exec -it dokcer_poilerplate_php sh -c "sh ../php-ci/bin/initialize.sh"

# make check
docker exec -it dokcer_poilerplate_php sh -c "make check"