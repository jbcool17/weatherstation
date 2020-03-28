#!/bin/bash

git pull origin feature/docker
GIT_HASH=$(git rev-parse --short HEAD)

docker build -t ws:base docker-base/

# docker run --rm -it -v $PWD:/app ws:base bundle install --path /app
# docker run --rm -it -v $PWD:/app ws:base yarn install

docker build -t ws:$GIT_HASH .

./redeploy.sh
