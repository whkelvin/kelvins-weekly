<script lang="ts">
	import type { KelvinsPick } from '$lib/types';
	let { pick }: { pick: KelvinsPick } = $props();
</script>

<footer class="mt-10 pt-6 pb-8 bg-card-bg px-6 -mx-4 md:-mx-8">
	<div class="max-w-2xl px-4 md:px-8">
		<p class="text-xs font-bold tracking-widest uppercase text-fg2 font-mono mb-1">
			Editor's Pick
		</p>
		<h2 class="text-2xl font-bold font-mono text-card-fg mb-1">Kelvin's Pick</h2>
		<a
			href={pick.url}
			target="_blank"
			rel="noopener noreferrer"
			class="font-bold text-lg text-card-fg hover:underline leading-snug block mb-2 font-mono"
		>
			{pick.title}
		</a>
		<p class="text-fg1 leading-relaxed text-sm">{pick.description}</p>
	</div>
</footer>
