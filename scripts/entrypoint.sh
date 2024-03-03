#!/bin/bash
set -x

if [ "${GIT_URL}" != "${GIT_URL#ssh://}" ] ; then
    curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=/tmp/code-server --version 4.21.1
    /tmp/code-server/bin/code-server --extensions-dir /tmp/code-server --auth none --port 13337 >/tmp/code-server.log 2>&1 &

    DOMAIN=$(echo "${GIT_URL}" | awk -F@ '{print $2}' | awk -F/ '{print $1}' | awk -F: '{print $1}')
    PORT=$(echo "${GIT_URL}" | awk -F: '{print $3}' | awk -F/ '{print $1}')
    PORT=${PORT:-22}
    mkdir -p  ~/.ssh
    ssh-keyscan -p ${PORT} ${DOMAIN} >> ~/.ssh/known_hosts
    git clone ${GIT_URL} ${WORKSPACE_FOLDER} --recurse-submodules

    killall coder || :
fi
