docker rm -f ws
docker run -d -it --name ws -v $PWD/db:/app/db -p 3000:3000 ws
