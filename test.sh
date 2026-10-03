ENV=${1:-${PWD}/envs/work}
source ${ENV}

: "${WORKSPACE:?Need to have workspace set}"

echo ${WORKSPACE}