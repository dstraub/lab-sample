#!/bin/bash

[[ -z $COURSE ]] && COURSE=DOxxx

echo -e "Hello $COURSE\nwebserver-version: $WEBSERVER_VERSION" > /usr/share/nginx/html/index.html

if [[ -f  /usr/share/nginx/html/env.properties ]]; then
  echo "add env.properties"
  cat /usr/share/nginx/html/env.properties >> /usr/share/nginx/html/index.html
fi

echo "" >> /usr/share/nginx/html/index.html

echo -e "==========\nstart nginx\nwebserver-version: $WEBSERVER_VERSION"
exec  nginx -g "daemon off;"

