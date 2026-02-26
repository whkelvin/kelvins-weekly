#!/usr/bin/env bash
set -euo pipefail

curl -s "http://www.aaronsw.com/2002/feeds/pgessays.rss" \
  | python3 -c "
import sys, xml.etree.ElementTree as ET, json

tree = ET.parse(sys.stdin)
items = tree.findall('.//item')
essays = [{'title': i.findtext('title'), 'url': i.findtext('link')} for i in items]
print(json.dumps(essays, indent=2))
"
