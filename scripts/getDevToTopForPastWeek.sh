#!/usr/bin/env bash
set -euo pipefail

curl -s "https://dev.to/feed?top=7" \
  | python3 -c "
import sys, xml.etree.ElementTree as ET, json

tree = ET.parse(sys.stdin)
items = tree.findall('.//item')
articles = [{'title': i.findtext('title'), 'url': i.findtext('link')} for i in items]
print(json.dumps(articles, indent=2))
"
