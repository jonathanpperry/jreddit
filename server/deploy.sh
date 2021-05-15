#!/bin/bash

echo deploying server via docker
echo input version to deploy:
read VERSION

docker build -t jonnyramen/jreddit:$VERSION .
docker push jonnyramen/jreddit:$VERSION
ssh root@139.59.242.238 "docker pull jonnyramen/jreddit:$VERSION && docker tag jonnyramen/jreddit:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"
