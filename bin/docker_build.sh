#!/bin/bash

github_organization=$GITHUB_ORGANIZATION
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

project=`basename $currentdir`
commitsha=`git rev-parse --verify HEAD`

echo $currentdir

echo "Building docker image: $builddir with tag: $basetag"
echo "-------------------------------------------------------------------------"
cd $builddir

echo "https://github.com/$github_organization/$project/tree/$commitsha" > REPO

docker build . -t $docker_organization/$basetag
while test ${#} -gt 0
do
  echo "Tagging $docker_organization/$basetag as #docker_organization/$1"
  docker tag $docker_organization/$basetag $docker_organization/$1
  shift
done
echo "============================================================================================"
echo "Finished building docker images: $builddir"
echo "============================================================================================"
