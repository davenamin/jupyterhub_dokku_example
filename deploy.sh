#!/bin/bash

# these are the commands necessary to get everything working.
# this will push the app, set up the appropriate port forwarding,
# and use the letsencrypt plugin

APP_NAME="hub"
SERVER_NAME="example.com"

git push dokku@$SERVER_NAME:$APP_NAME master

ssh -t dokku@$SERVER_NAME proxy:ports-add $APP_NAME http:80:8000

ssh -t dokku@$SERVER_NAME letsencrypt $APP_NAME
