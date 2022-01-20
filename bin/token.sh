#!/usr/bin/env bash
TOKEN=$1

curl http://localhost:8091/test/hello -H "Authorization: Bearer $TOKEN"
curl http://localhost:8091/test/world -H "Authorization: Bearer $TOKEN"
