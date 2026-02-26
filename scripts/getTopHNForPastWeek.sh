#!/usr/bin/env bash
set -euo pipefail

curl -s "https://hn.algolia.com/api/v1/search?tags=story&numericFilters=created_at_i>$(date -d '7 days ago' +%s)&hitsPerPage=10&orderBy=points" \
  | jq '[.hits | sort_by(-.points) | .[:10] | .[] | {title: .title, url: (.url // ("https://news.ycombinator.com/item?id=" + (.objectID)))}]'
