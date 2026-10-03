#!/bin/bash
ENV=${1:-${PWD}/envs/work}
source ${ENV}

: "${WORKSPACE:?Need to have workspace set}"

rm -rf ${WORKSPACE}
cp -rc ${PWD}/backup ${WORKSPACE}
