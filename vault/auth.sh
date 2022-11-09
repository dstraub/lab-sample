#!/bin/bash

VAULT_URL=https://vault-huk.apps.eu410.prod.nextcle.com
VAULT_TOKEN=hvs.ICxI2RZFGRhtYZX8kJx0dbrU

SA_SECRET=do180-huk-token-bz8vh
SA_TOKEN=$(oc get secrets $SA_TOKEN -o jsonpath='{ .data.token }' | base64 -d)

curl -H "Authorization: Bearer $VAULT_TOKEN" $VAULT_URL/v1/auth/kubernetes/login -d "{\"jwt\": \"SA_TOKEN\", \"role\": \"do180\"}" 

