Fetch recent podcast episodes from the past 7 days from subscribed Spotify shows.
check if $SPOTIFY_CLIENT_ID and $SPOTIFY_CLIENT_SECRETS are defined first, if not, prompt user to run `direnv allow .` first
Run `./scripts/getSpotifyPodcastsForPastWeek.sh` and return the JSON result. Each entry has `{title, embedUrl}`.
