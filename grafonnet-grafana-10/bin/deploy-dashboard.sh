#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "Please, specify a file with the dashboard definition"
    exit 1
fi

# crete a temporary folder for JSON dashboard definitions
mkdir -p build
rm -rf build/dashboard.json

jsonnet --jpath "$(pwd)/vendor" "$1" > build/dashboard.json

payload="{\"dashboard\": $(jq . build/dashboard.json), \"overwrite\": true}"

curl -X POST $BASIC_AUTH \
  -H 'Content-Type: application/json' \
  -d "${payload}" \
  "http://admin:admin@localhost:3000/api/dashboards/db"

echo 'Deployed'