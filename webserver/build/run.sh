#!/bin/bash

[[ -z $COURSE ]] && COURSE=DOxxx

echo "Hello $COURSE" > /usr/share/nginx/html/index.html
if [[ -f  /usr/share/nginx/html/env.properties ]]; then
  echo "add env.properties"
  cat /usr/share/nginx/html/env.properties >> /usr/share/nginx/html/index.html
fi
echo "start nginx"
exec  nginx -g "daemon off;"

