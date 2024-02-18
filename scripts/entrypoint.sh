#!/bin/sh

set -x

if [ "$GIT_URL" != "${GIT_URL#ssh://}" ] ; then
  echo "SSH URL detected, trying to clone via SSH"
  eval $(ssh-agent)
  DOMAIN=$(echo "$GIT_URL" | awk -F@ '{print $2}' | awk -F/ '{print $1}' | awk -F: '{print $1}')
  PORT=$(echo "$GIT_URL" | awk -F: '{print $3}' | awk -F/ '{print $1}')
  PORT=${PORT:-22}
  mkdir -p  ~/.ssh
  ssh-keyscan -p $PORT $DOMAIN >> ~/.ssh/known_hosts
  git clone $GIT_URL $WORKSPACE_FOLDER --recurse-submodules
fi

/.envbuilder/bin/envbuilder