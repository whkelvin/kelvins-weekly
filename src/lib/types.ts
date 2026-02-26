export interface Article {
	title: string;
	url: string;
	why: string;
	description: string;
}

export interface Repo {
	name: string;
	url: string;
	starsThisWeek: number;
	why: string;
	description: string;
}

export interface Video {
	title: string;
	youtubeId: string;
	why: string;
	description: string;
}

export interface Podcast {
	title: string;
	why: string;
	description: string;
	spotifyEmbedUrl: string;
}

export interface KelvinsPick {
	title: string;
	url: string;
	description: string;
}

export interface Edition {
	date: string;
	articles: Article[];
	repos: Repo[];
	videos: Video[];
	podcasts: Podcast[];
	kelvinsPick: KelvinsPick;
}

// Draft types — raw journalist output (fewer fields than curated editions)
export interface DraftArticle {
	title: string;
	url: string;
}

export interface DraftRepo {
	name: string;
	url: string;
	starsThisWeek: number;
}

export interface DraftVideo {
	title: string;
	youtubeId: string;
}

export interface DraftPodcast {
	title: string;
	spotifyEmbedUrl: string;
}

export interface DraftEdition {
	date: string;
	articles: DraftArticle[];
	repos: DraftRepo[];
	videos: DraftVideo[];
	podcasts: DraftPodcast[];
	kelvinsPick: KelvinsPick;
}

export interface VetItem<T> {
	data: T;
	removed: boolean;
}
