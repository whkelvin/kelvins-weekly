<script lang="ts">
	import type { KelvinsPick } from '$lib/types';
	let { pick }: { pick: KelvinsPick } = $props();
</script>

<footer class="border-t-4 border-stone-900 mt-10 pt-6 pb-8 bg-stone-300 px-6 -mx-4 md:-mx-8">
	<div class="max-w-2xl px-4 md:px-8">
		<p class="text-xs font-bold tracking-widest uppercase text-stone-500 font-mono mb-1">
			Editor's Pick
		</p>
		<h2 class="text-2xl font-bold font-mono text-stone-900 mb-1">Kelvin's Pick</h2>
		<div class="w-16 border-b-2 border-stone-900 mb-4"></div>
		<a
			href={pick.url}
			target="_blank"
			rel="noopener noreferrer"
			class="font-bold text-lg text-stone-900 hover:underline leading-snug block mb-2 font-mono"
		>
			{pick.title}
		</a>
		<p class="text-stone-700 leading-relaxed text-sm">{pick.description}</p>
	</div>
</footer>
