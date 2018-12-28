#!/bin/bash

set -e

while read line;
do
    eval "$line"
done<config.conf


BITLOOP_CONF="/etc/nginx/conf.d/bitloop.conf"
sed -i "s/SERVER_NAME/$SERVER_NAME/g" $BITLOOP_CONF
sed -i "s/SERVER_PORT/$SERVER_PORT/g" $BITLOOP_CONF
OLD_IFS=$IFS
IFS=" "
NODES=""
for node in $NODE_NAME
do
    NODES+="server "$node" max_fails=1 fail_timeout=10s;\n"
done
IFS=$OLD_IFS

sed -i "s/NODE_NAME/$NODES/g" $BITLOOP_CONF

if [[ $SSL -eq "on" ]];then
    ssl_config="ssl on;\nssl_certificate \/ssl\/bitloop.cert;\n\
    ssl_certificate_key \/ssl\/bitloop.key;\n"
    sed -i "s/SSL/$ssl_config/g" $BITLOOP_CONF
fi

nginx 
