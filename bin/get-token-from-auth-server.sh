#!/usr/bin/env bash

CLIENT_ID="oauth-client"
SCOPE="user_info"
CODE="$1"
REDIRECT_URI="http://localhost:8080/login/oauth2/code/minimax"
GRANT_TYPE="authorization_code"
CLIENT_SECRET="oauth-secret"

doCurl() {
  curl -v -X POST \
    -v \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "client_secret=$CLIENT_SECRET" \
    -d "code=$CODE" \
    -d "client_id=$CLIENT_ID" \
    -d "scope=$SCOPE" \
    -d "redirect_uri=$REDIRECT_URI" \
    -d "grant_type=$GRANT_TYPE" \
    "http://localhost:8081/auth/oauth2/token"
}

doCurl $CODE
