#!/bin/bash


IMAGE_ID=$1
if [ "$#" -ne 1 ];then
    echo "Need one argument image ID, but get $#"
else
    docker run -d -p0.0.0.0:8080:80 -v $PWD/nginx.conf:/etc/nginx/nginx.conf -v $PWD/bitloop.conf:/etc/nginx/conf.d/bitloop.conf -v $PWD/logs:/var/log/nginx/bitloop -v $PWD/ssl:/etc/nginx/conf.d/ $IMAGE_ID
fi
