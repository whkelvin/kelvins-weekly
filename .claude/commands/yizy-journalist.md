Gather data from all sources and build a draft edition JSON file.

Run ALL of the following scripts in parallel and collect their JSON output:

1. `./scripts/getTopHNForPastWeek.sh` — top HN articles (title, url)
2. `./scripts/getDevToTopForPastWeek.sh` — top dev.to articles (title, url)
3. `./scripts/getPGEssays.sh` — PG essays (title, url)
4. invoke the anthropic-news.md agent skills to grab a list of anthropic news — Anthropic/Claude Code news (title, url)
5. `./scripts/getGHTrendingForPastWeek.sh` — trending GitHub repos (name, url, starsThisWeek)
6. `./scripts/getSubscribedYTVideosForPastWeek.sh` — recent YouTube videos (title, youtubeId)
7. `./scripts/getSpotifyPodcastsForPastWeek.sh` — recent podcast episodes (title, embedUrl)

Then build a JSON file at `yizy-journalist/YYYY-MM-DD.json` (using today's date) with this structure:

```json
{
  "date": "YYYY-MM-DD",
  "articles": [{ "title": "...", "url": "..." }],
  "repos": [{ "name": "...", "url": "...", "starsThisWeek": 123 }],
  "videos": [{ "title": "...", "youtubeId": "..." }],
  "podcasts": [{ "title": "...", "spotifyEmbedUrl": "..." }],
  "kelvinsPick": {
    "title": "",
    "url": ""
  }
}
```

Notes:

- **articles**: Combine results from HN, dev.to, PG essays, and Anthropic news. Deduplicate by URL.
- **repos**: From GitHub trending.
- **videos**: From YouTube.
- **podcasts**: From Spotify. Map `embedUrl` to `spotifyEmbedUrl`.
- **kelvinsPick**: Leave empty (title and url as empty strings) — this is filled in manually later.
- Do NOT include `why` or `description` fields — those are omitted in this draft.
- If any script fails or returns empty, include an empty array for that section and note which script failed.
