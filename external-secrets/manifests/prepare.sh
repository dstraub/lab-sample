#!/bin/bash

echo -n "straubcloud-password: " 
read -s STRAUBCLOUD_PASSWORD
echo

echo -n "redhat-password: "
read -s REDHAT_PASSWORD
echo

podman login -u devops -p $STRAUBCLOUD_PASSWORD --authfile=.dockerconfig.json registry.straubcloud.de
podman login -u danielstraub -p $REDHAT_PASSWORD --authfile=.dockerconfig.json registry.redhat.io

[[ ! -d .ssh ]] && mkdir .ssh
cp ~/.ssh/id_rsa .ssh/

echo -e 'Host *\n  StrictHostKeyChecking no' > .ssh/config

