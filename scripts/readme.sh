#!/usr/bin/env bash

curl https://www.hendriklammers.com/api/github | jq -r '.introText' > README.md
