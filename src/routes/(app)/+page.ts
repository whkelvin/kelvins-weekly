import { getLatestEdition } from '$lib/data/index';
import { redirect } from '@sveltejs/kit';

export const prerender = true;

export function load() {
	const latest = getLatestEdition();
	redirect(307, `/${latest.date}`);
}
