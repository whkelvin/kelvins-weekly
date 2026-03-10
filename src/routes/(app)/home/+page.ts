import { getLatestEdition } from '$lib/data/index';

export const prerender = true;

export function load() {
	const latest = getLatestEdition();
	return {
		latestDate: latest.date
	};
}
