Fetch YouTube videos published in the past 7 days from channels listed in `scripts/yt-recent.sh`.

Run `./scripts/getSubscribedYTVideosForPastWeek.sh` and return the JSON result. Each entry has `{title, youtubeId}` where the embed URL is `https://www.youtube.com/embed/{youtubeId}`.
