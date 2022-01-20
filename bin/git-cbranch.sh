#!/usr/bin/env bash

LINGO_PATH="/c/dev/lingo-oauth/ws/lingo.git"
EXTERNAL_ANNOTATIONS="/c/dev/lingo-oauth/ws/ExternalAnnotations"
CLIENT_V="/c/dev/lingo-oauth/ws/client-v.git"

# check from branch name passed as arg
((!$#)) && echo "No branch name, command ignored!" && exit 1
BRANCH=$1

declare -a PROJECTS=($LINGO_PATH $EXTERNAL_ANNOTATIONS $CLIENT_V)
for project in ${PROJECTS[@]};
do
	cd $project
	git checkout $BRANCH
done
