CREDENTIALS=`echo "username:password" | base64 -`
curl http://localhost:8080/ -H "Authorization: Basic $CREDENTIALS"
