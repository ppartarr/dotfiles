#!/usr/bin/env bash

# options to cleanly run bash script
set -euox pipefail

# get the uptime as hhmmss
uptime=`uptime | awk '{print $1}' | tr -d :`

if [ uptime -gt 30000 ]; then
  # send email using gmail api
fi
