#!/usr/bin/env bash

TENANT_ID="dceff11f-6e74-436e-b9a0-65f9697b8472"
CLIENT_ID="e52d83a9-40c0-42ae-aae3-d5054ef24919"
SCOPE="https%3A%2F%2Fgraph.microsoft.com%2Fuser.read"
CODE="OAQABAAIAAABeAFzDwllzTYGDLh_qYbH8Z_A3R69jLX6-mMNetGunYY-K02c8YN5mKuH84_rhvzJdGTttpWYR1GQj_f21TWUCI0gDlIE3jEkApZ8u7Rr7MWKcvcwI677fiS4OK9qZgQvvJ0nBe65wziXwphW7m4NFSZvjyPzhDFiVCrvfzH_7PxYrz78-nh4kPcxiJQNrXdF4p5JnBdDUH80NATxY4myWgRBEAQ1COhkP818uXyWS32qSokwQKpEOqg00cYCKyKK90t6GLiIGV2nLTOsgZfzZBZefG3mjeKwN80hzp6swQLs_pF2Yz2jUOe5UtlEbroTCzN0gU-VAUSlL_Z6Peq61VxdeMhNbrlSluhO1DtgrQOnPxqPzxzpxJIW3qGF3oNIP7Y6XJaki9HFiycyYMzHGygm52xxBuQytfRTRYQdNadR9eumxW9JJaO06WFGLNXcecSqBSB3-0Y8ENrIJUBaWkpTVwrnoyWHo2Ex_Ne4NNckRgG8zWTA4wV533_RbYv0Mya9LXYqkJMV2kEVQ4XUMA2H-q2nmtfLzTVmY3LgBn-E_4pFchroZ--9Y1oLPvRaqxdfOB2qy3m1oKl2K-og5KQGrLI6QiZm9pbRhG0t-dsQCMlz2i9cM36ppuYmKzjKtpESov199wAAnf93leN7lCOJENG5eX6AxMcJPN41d9E0Dl2vc-kukriD_nxUPZBOTaMScsYrQn0IrVYEC6JmBGMFB0g39f0kkb5WzLe71xjXZddyk3yVGaovz_PLXx0o0z0dBAqAiOPLXpFkFL0WYA8IeXVlqaAtJloG4gSMSD9Dluyi3AkrD0VvC6QRvjI4Ic9vA6g5BdyFjloKn58s0IAA%0A%40t%3A1uqW2cYN1iH7S%5DRQqBiHgchhvEr%2F%5B"
REDIRECT_URI="http%3A%2F%2Flocalhost%3A8080%2Flogin%2Foauth2%2Fcode%2Fazure"
GRANT_TYPE="authorization_code"
CLIENT_SECRET="%40t%3A1uqW2cYN1iH7S%5DRQqBiHgchhvEr%2F%5B"

curl -X POST \
  -v \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_secret=$CLIENT_SECRET" \
  -d "code=$CODE" \
  -d "client_id=$CLIENT_ID" \
  -d "scope=$SCOPE" \
  -d "redirect_uri=$REDIRECT_URI" \
  -d "grant_type=$GRANT_TYPE" \
  "https://login.microsoftonline.com/$TENANT_ID/oauth2/v2.0/token"
