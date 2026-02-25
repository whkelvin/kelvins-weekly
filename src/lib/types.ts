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
