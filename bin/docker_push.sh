#!/bin/bash

docker_organization=$DOCKER_ORGANIZATION

if [ "$#" -lt 2 ]; then
  echo "You need to provide a directory with a Dockerfile in it and a tag."
  exit 1
fi

builddir=$1
shift
basetag=$1
shift
tags=$@
currentdir=$(pwd)

echo $currentdir

echo "Login to docker"
echo "-------------------------------------------------------------------------"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

cd $builddir

echo "Pushing $docker_organization/$basetag"
docker push $docker_organization/$basetag

while test ${#} -gt 0
do
  echo "Pushing $docker_organization/$1"
  docker push $docker_organization/$1
  shift
done
echo "============================================================================================"
echo "Finished pushing docker images: $builddir"
echo "============================================================================================"


