import { getEdition, getEditions } from '$lib/data/index';
import { error } from '@sveltejs/kit';
import type { PageLoad } from './$types';

export const prerender = true;

export function entries() {
	return getEditions().map((e) => ({ date: e.date }));
}

export const load: PageLoad = ({ params }) => {
	const edition = getEdition(params.date);
	if (!edition) error(404, `Edition ${params.date} not found`);
	return { edition };
};
