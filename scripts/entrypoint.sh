#!/bin/sh

if [ "$GIT_URL" != "${GIT_URL#ssh://}" ] ; then
  git clone $GIT_URL $WORKSPACE_FOLDER
fi


/.envbuilder/bin/envbuilder