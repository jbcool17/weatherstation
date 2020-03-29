#!/bin/bash

GIT_HASH=$(git rev-parse --short HEAD)
cp -pvr .current_version .previous_version
docker rm -f ws
docker run -d -it --name ws -v $PWD/db:/app/db -p 3000:3000 --always ws:$GIT_HASH && echo $GIT_HASH > .current_version
