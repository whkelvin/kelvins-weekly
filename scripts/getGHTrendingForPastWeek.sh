#!/usr/bin/env bash
set -euo pipefail

curl -s "https://github.com/trending?since=weekly&spoken_language_code=en" \
  | python3 -c "
import sys, re, json

html = sys.stdin.read()
articles = re.split(r'<article class=\"Box-row\">', html)[1:]

repos = []
for art in articles:
    # Repo link is inside <h2 class='h3 lh-condensed'> <a ... href='/owner/repo'>
    link = re.search(r'<h2[^>]*>.*?href=\"(/[^/]+/[^\"]+)\"', art, re.DOTALL)
    if not link:
        continue

    path = link.group(1).strip()
    name = path.lstrip('/')
    url = 'https://github.com' + path

    stars_match = re.search(r'([\d,]+)\s+stars this week', art)
    stars = int(stars_match.group(1).replace(',', '')) if stars_match else 0

    repos.append({'name': name, 'url': url, 'starsThisWeek': stars})

print(json.dumps(repos, indent=2))
"
