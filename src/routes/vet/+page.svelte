<script lang="ts">
	import type {
		DraftEdition,
		DraftArticle,
		DraftRepo,
		DraftVideo,
		DraftPodcast,
		VetItem,
	} from "$lib/types";
	import VetSection from "$lib/components/vet/VetSection.svelte";

	let draft = $state<DraftEdition | null>(null);

	let articles = $state<VetItem<DraftArticle>[]>([]);
	let repos = $state<VetItem<DraftRepo>[]>([]);
	let videos = $state<VetItem<DraftVideo>[]>([]);
	let podcasts = $state<VetItem<DraftPodcast>[]>([]);

	let exported = $state(false);
	let showImport = $state(false);
	let jsonInput = $state("");
	let parseError = $state<string | null>(null);

	function importJson() {
		parseError = null;
		try {
			const d: DraftEdition = JSON.parse(jsonInput);
			if (!d.articles || !d.repos || !d.videos || !d.podcasts) {
				parseError =
					"JSON is missing required fields (articles, repos, videos, podcasts).";
				return;
			}
			draft = d;
			articles = d.articles.map((a) => ({ data: a, removed: false }));
			repos = d.repos.map((r) => ({ data: r, removed: false }));
			videos = d.videos.map((v) => ({ data: v, removed: false }));
			podcasts = d.podcasts.map((p) => ({ data: p, removed: false }));
			showImport = false;
			jsonInput = "";
		} catch {
			parseError = "Invalid JSON. Please check your input.";
		}
	}

	function exportJson() {
		if (!draft) return;
		const output: DraftEdition = {
			date: draft.date,
			articles: articles.filter((i) => !i.removed).map((i) => i.data),
			repos: repos.filter((i) => !i.removed).map((i) => i.data),
			videos: videos.filter((i) => !i.removed).map((i) => i.data),
			podcasts: podcasts.filter((i) => !i.removed).map((i) => i.data),
			kelvinsPick: draft.kelvinsPick,
		};
		navigator.clipboard.writeText(JSON.stringify(output, null, 2));
		exported = true;
		setTimeout(() => (exported = false), 2000);
	}
</script>

<div class="min-h-screen bg-stone-200">
	<!-- Top bar -->
	<div
		class="sticky top-0 z-20 bg-stone-900 border-b border-stone-700 px-4 md:px-6 py-3 flex items-center justify-between"
	>
		<h1 class="yizy-title !text-stone-100 text-lg">Vet Drafts</h1>
		<button
			onclick={() => (showImport = !showImport)}
			class="px-4 py-1.5 bg-stone-700 text-stone-200 font-mono text-sm tracking-wide
				hover:bg-stone-600 transition-colors rounded"
		>
			{showImport ? "Cancel" : "Import JSON"}
		</button>
	</div>

	<!-- Import panel -->
	{#if showImport}
		<div
			class="bg-stone-100 border-b border-stone-300 p-4 md:p-6 max-w-4xl mx-auto"
		>
			<label
				for="json-import-input"
				class="block font-mono text-xs text-stone-500 mb-2 tracking-wide uppercase"
				>Paste draft JSON</label
			>
			<textarea
				id="json-import-input"
				bind:value={jsonInput}
				placeholder={'{"date": "2026-02-25", "articles": [...], ...}'}
				class="w-full h-48 p-3 bg-white border border-stone-300 rounded font-mono text-sm
					text-stone-800 placeholder-stone-400 resize-y focus:outline-none focus:ring-2
					focus:ring-stone-500 focus:border-transparent"
			></textarea>
			{#if parseError}
				<p class="text-red-600 text-xs font-mono mt-2">{parseError}</p>
			{/if}
			<button
				onclick={importJson}
				class="mt-3 px-6 py-2 bg-stone-900 text-stone-100 font-mono text-sm tracking-wide
					hover:bg-stone-800 transition-colors rounded disabled:opacity-40"
				disabled={!jsonInput.trim()}
			>
				Load Draft
			</button>
		</div>
	{/if}

	<!-- Main feed -->
	<main class="max-w-4xl mx-auto p-6 md:p-10">
		{#if !draft}
			<p class="text-stone-500 font-mono text-sm mt-20 text-center">
				Click "Import JSON" above to paste a draft.
			</p>
		{:else}
			<h2 class="yizy-title text-xl mb-6">{draft.date}</h2>

			<VetSection title="Videos" bind:items={videos}>
				{#snippet row(v: DraftVideo, _i: number)}
					<div class="flex items-start gap-3">
						<iframe
							src="https://www.youtube.com/embed/{v.youtubeId}"
							width="320"
							height="180"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen
							title={v.title}
							class="rounded shrink-0 bg-stone-900"
						></iframe>
						<span class="yizy-subtitle mt-1">{v.title}</span>
					</div>
				{/snippet}
			</VetSection>

			<VetSection title="Podcasts" bind:items={podcasts}>
				{#snippet row(p: DraftPodcast, _i: number)}
					<div>
						<p class="yizy-subtitle mb-1">{p.title}</p>
						<iframe
							src={p.spotifyEmbedUrl}
							width="100%"
							height="80"
							allow="encrypted-media"
							title={p.title}
							class="rounded"
						></iframe>
					</div>
				{/snippet}
			</VetSection>

			<VetSection title="Articles" bind:items={articles}>
				{#snippet row(a: DraftArticle, _i: number)}
					<a
						href={a.url}
						target="_blank"
						rel="noopener"
						class="yizy-subtitle hover:text-stone-900 transition-colors"
					>
						{a.title}
					</a>
				{/snippet}
			</VetSection>

			<VetSection title="Repos" bind:items={repos}>
				{#snippet row(r: DraftRepo, _i: number)}
					<div class="flex items-center gap-2">
						<a
							href={r.url}
							target="_blank"
							rel="noopener"
							class="yizy-subtitle hover:text-stone-900 transition-colors"
						>
							{r.name}
						</a>
						<span class="text-xs text-stone-400 font-mono"
							>+{r.starsThisWeek}</span
						>
					</div>
				{/snippet}
			</VetSection>

			<!-- Export -->
			<div
				class="sticky bottom-0 bg-stone-200 border-t border-stone-300 py-4 mt-6"
			>
				<button
					onclick={exportJson}
					class="px-6 py-2 bg-stone-900 text-stone-100 font-mono text-sm tracking-wide
						hover:bg-stone-800 transition-colors rounded"
				>
					{exported ? "Copied to clipboard!" : "Export JSON"}
				</button>
			</div>
		{/if}
	</main>
</div>
