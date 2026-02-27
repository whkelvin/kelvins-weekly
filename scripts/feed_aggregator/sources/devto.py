"""Fetch top Dev.to articles from the past week."""

import feedparser


def fetch_devto_top(top=7):
    feed = feedparser.parse(f"https://dev.to/feed?top={top}")
    return [{"title": e.title, "url": e.link} for e in feed.entries]
