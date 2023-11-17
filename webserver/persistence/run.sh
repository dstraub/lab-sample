#!/bin/bash

# envsubst isn't available in the nginx image
sed -e "s/POD_NAME/$POD_NAME/g" /etc/nginx/nginx.conf > /tmp/nginx.conf

mkdir -p /var/log/nginx/$POD_NAME

exec nginx -c /tmp/nginx.conf -g "daemon off;"
