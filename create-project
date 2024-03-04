#!/bin/bash

[[ -z $1 ]] && echo "Name required" && exit

oc new-project $1 1>/dev/null

sleep 3

oc label namespace $1 "security.openshift.io/scc.podSecurityLabelSync=false" 1>/dev/null

for MODE in audit enforce warn;do
  oc label namespace $1 pod-security.kubernetes.io/$MODE=baseline  --overwrite 1>/dev/null
done

echo "Project $1 created"

