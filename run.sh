#!/bin/bash
ENV=${1:-${PWD}/envs/work}
source ${ENV}

: "${WORKSPACE:?Need to have workspace set}"

rm -rf ${PWD}/backup
#cp -rc ${WORKSPACE} ${PWD}/backup
docker run \
    -u $(id -u):$(id -g) \
    --add-host=host.docker.internal:host-gateway \
    -v ${WORKSPACE}:/workspace \
    -v ${PWD}/pi:/pi \
    -v ${PWD}/cargo:/opt/cargo/registry \
    -v /run/media/admin/Data/winn64libs/sdk:/sdk \
    --rm -it \
    pi
