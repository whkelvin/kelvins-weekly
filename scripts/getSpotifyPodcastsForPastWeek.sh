#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHOWS_FILE="$SCRIPT_DIR/spotify-shows.txt"
SINCE=$(date -d '7 days ago' +%Y-%m-%d)

TOKEN=$(curl -s -X POST "https://accounts.spotify.com/api/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials&client_id=${SPOTIFY_CLIENT_ID}&client_secret=${SPOTIFY_CLIENT_SECRET}" \
  | jq -r '.access_token')

grep -v '^\s*#' "$SHOWS_FILE" | grep -v '^\s*$' | while IFS=: read -r _name showId; do
  curl -s "https://api.spotify.com/v1/shows/$showId/episodes?limit=10" \
    -H "Authorization: Bearer $TOKEN"
done \
  | jq -s --arg since "$SINCE" \
    '[.[].items[] | select(.release_date >= $since) | {title: .name, embedUrl: ("https://open.spotify.com/embed/episode/" + .id)}]'
