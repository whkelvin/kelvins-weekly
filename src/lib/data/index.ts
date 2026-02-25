import type { Edition } from '$lib/types';

// Import all edition JSON files using Vite's import.meta.glob (eager)
const editionModules = import.meta.glob('./*.json', { eager: true });

function loadEditions(): Edition[] {
	return Object.values(editionModules)
		.map((mod) => (mod as { default: Edition }).default)
		.sort((a, b) => b.date.localeCompare(a.date));
}

export function getEditions(): Edition[] {
	return loadEditions();
}

export function getEdition(date: string): Edition | undefined {
	return loadEditions().find((e) => e.date === date);
}

export function getLatestEdition(): Edition {
	const editions = loadEditions();
	if (editions.length === 0) throw new Error('No editions found');
	return editions[0];
}
