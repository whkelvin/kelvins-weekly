#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHANNELS_FILE="$SCRIPT_DIR/youtube-channels.txt"
SINCE=$(date -d '7 days ago' +%s)

RAWFILE=$(mktemp)
OUTFILE=$(mktemp)
trap 'rm -f "$RAWFILE" "$OUTFILE"' EXIT

# Step 1: Fetch all feeds and extract entry data
while IFS= read -r HANDLE; do
  HANDLE="${HANDLE#@}"
  CID=$(curl -s "https://www.youtube.com/@${HANDLE}" \
    | grep -oP 'channel_id=\K[^"&]+' | head -1)
  [ -z "$CID" ] && continue
  curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=$CID" \
    | awk '
      /<entry>/  { in_entry=1; vid=""; title=""; pub="" }
      /<\/entry>/ { if (in_entry && vid != "") print pub "\t" vid "\t" title; in_entry=0 }
      in_entry && /<yt:videoId>/ { gsub(/.*<yt:videoId>/, ""); gsub(/<\/yt:videoId>.*/, ""); vid=$0 }
      in_entry && /<title>/ { gsub(/.*<title>/, ""); gsub(/<\/title>.*/, ""); title=$0 }
      in_entry && /<published>/ { gsub(/.*<published>/, ""); gsub(/<\/published>.*/, ""); pub=$0 }
    ' >> "$RAWFILE"
done < <(grep -v '^\s*#' "$CHANNELS_FILE" | grep -v '^\s*$')

# Step 2: Filter by date
while IFS=$'\t' read -r published videoId title; do
  [ -z "$videoId" ] && continue
  pubTs=$(date -d "$published" +%s 2>/dev/null || echo 0)
  if [ "$pubTs" -ge "$SINCE" ]; then
    printf '%s\t%s\n' "$videoId" "$title" >> "$OUTFILE"
  fi
done < "$RAWFILE"

# Step 3: Output as JSON
jq -Rn '[inputs | split("\t") | {title: .[1], youtubeId: .[0]}]' < "$OUTFILE"
