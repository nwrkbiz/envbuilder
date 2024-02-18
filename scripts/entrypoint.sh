#!/bin/sh

if [ "$GIT_URL" != "${GIT_URL#ssh://}" ] ; then
  eval $(ssh-agent)
  DOMAIN=echo "$GIT_URL" | awk -F@ '{print $2}' | awk -F/ '{print $1}'
  ssh-keyscan $DOMAIN >> ~/.ssh/known_hosts
  git clone $GIT_URL $WORKSPACE_FOLDER
fi

/.envbuilder/bin/envbuilder