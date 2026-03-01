"""Aggregate all feed sources into a draft Edition JSON."""

import json
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import date
from pathlib import Path

from sources.hn import fetch_top_hn
from sources.gh_trending import fetch_gh_trending
from sources.pg_essays import fetch_pg_essays
from sources.devto import fetch_devto_top
from sources.claude_blog import fetch_claude_blog
from sources.blogs import fetch_blogs
from sources.spotify import fetch_spotify_podcasts
from sources.youtube import fetch_yt_videos


def _fetch_spotify_safe():
    try:
        return fetch_spotify_podcasts()
    except KeyError:
        print("WARNING: SPOTIFY_CLIENT_ID / SPOTIFY_CLIENT_SECRET not set, skipping podcasts", file=sys.stderr)
        return []


SOURCES = {
    "articles": [
        ("HN", fetch_top_hn),
        ("Dev.to", fetch_devto_top),
        ("PG essays", fetch_pg_essays),
        ("Claude blog", fetch_claude_blog),
        ("Tech blogs", fetch_blogs),
    ],
    "repos": [
        ("GitHub trending", fetch_gh_trending),
    ],
    "videos": [
        ("YouTube", fetch_yt_videos),
    ],
    "podcasts": [
        ("Spotify", _fetch_spotify_safe),
    ],
}


def main():
    results = {"articles": [], "repos": [], "videos": [], "podcasts": []}

    # Flatten all sources into (category, name, fn) tuples
    tasks = []
    for category, sources in SOURCES.items():
        for name, fn in sources:
            tasks.append((category, name, fn))

    with ThreadPoolExecutor(max_workers=10) as pool:
        future_to_task = {}
        for category, name, fn in tasks:
            future_to_task[pool.submit(fn)] = (category, name)

        for future in as_completed(future_to_task):
            category, name = future_to_task[future]
            try:
                items = future.result()
                results[category].extend(items)
                print(f"  {name}: {len(items)} items", file=sys.stderr)
            except Exception as e:
                print(f"  {name}: ERROR - {e}", file=sys.stderr)

    draft = {
        "date": date.today().isoformat(),
        "articles": results["articles"],
        "repos": results["repos"],
        "videos": results["videos"],
        "podcasts": results["podcasts"],
    }

    output = json.dumps(draft, indent=2, ensure_ascii=False)

    # Create output folder and save automatically
    output_dir = Path(__file__).parent / "output"
    output_dir.mkdir(exist_ok=True)
    outpath = output_dir / f"{date.today().isoformat()}.json"
    with open(outpath, "w") as f:
        f.write(output + "\n")
    print(f"Draft written to {outpath}", file=sys.stderr)

    # Print to stdout as well for piping
    print(output)


if __name__ == "__main__":
    main()
