#!/usr/bin/env bash

TOKEN=`curl oauth-client:oauth-secret@localhost:8090/auth/oauth/token -dgrant_type=password -dscope=user_info -dusername=philippe@minimaxlabs.com -dpassword=password | jq -r '.access_token'`
echo -e "$TOKEN\n"
curl -X POST http://localhost:8090/auth/introspect -dtoken="$TOKEN" | jq -r
echo -e "\n"
