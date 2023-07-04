#!/bin/bash

json_output=$(curl -s https://www.hendriklammers.com/api/github)

echo $json_output | jq -r '.introText' > README.md
echo "" >> README.md
echo "" >> README.md
echo "## Latest articles" >> README.md

num_articles=$(echo $json_output | jq '.latestArticles | length')
for (( i=0; i<$num_articles; i++ ))
do
  title=$(echo $json_output | jq -r ".latestArticles[$i].title")
  url=$(echo $json_output | jq -r ".latestArticles[$i].url")

  echo "- [$title]($url)" >> README.md
done
