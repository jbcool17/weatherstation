#!/bin/bash

git pull origin feature/docker
docker build -t ws .

./redeploy.sh
