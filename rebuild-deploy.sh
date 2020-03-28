#!/bin/bash

git pull origin feature/docker

docker build -t ws:base docker-base/

# docker run --rm -it -v $PWD:/app ws:base bundle install --path /app
# docker run --rm -it -v $PWD:/app ws:base yarn install

docker build -t ws .

./redeploy.sh
