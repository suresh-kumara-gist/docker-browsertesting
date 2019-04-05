#!/bin/bash
# Rebuild script
# This is meant to be run on a regular basis to make sure everything works with
# the latest version of scripts.

set -e

CREDENTIALS="$HOME/.dcycle-docker-credentials.sh"

if [ ! -f "$CREDENTIALS" ]; then
  echo "Please create $CREDENTIALS and add to it:"
  echo "DOCKERHUBUSER=xxx"
  echo "DOCKERHUBPASS=xxx"
  exit;
else
  source "$CREDENTIALS";
fi

DATE=`date '+%Y-%m-%d-%H-%M-%S-%Z'`
MAJORVERSION='3'
VERSION='3.0'

# Start by getting the latest version of the official drupal image
docker pull node
# Rebuild the entire thing
docker build --no-cache -t dcycle/browsertesting:"$VERSION" .
docker build -t dcycle/browsertesting:"$MAJORVERSION" .
docker build -t dcycle/browsertesting:"$MAJORVERSION".$DATE .
docker build -t dcycle/browsertesting:"$VERSION".$DATE .
docker login -u"$DOCKERHUBUSER" -p"$DOCKERHUBPASS"
docker push dcycle/browsertesting:"$VERSION"
docker push dcycle/browsertesting:"$MAJORVERSION"
docker push dcycle/browsertesting:"$VERSION"."$DATE"
docker push dcycle/browsertesting:"$MAJORVERSION"."$DATE"
# No longer using the latest tag, use the major version tag instead.
