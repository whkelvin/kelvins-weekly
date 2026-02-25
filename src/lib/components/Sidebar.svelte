<script lang="ts">
	import type { Edition } from '$lib/types';

	let {
		editions,
		currentDate,
		open = $bindable(true)
	}: { editions: Edition[]; currentDate: string; open: boolean } = $props();

	function formatShort(d: string): string {
		return new Date(d + 'T00:00:00').toLocaleDateString('en-US', {
			month: 'short',
			day: 'numeric',
			year: 'numeric'
		});
	}
</script>

<!--
	Mobile: fixed overlay, toggled by the hamburger button in layout.
	Desktop: in-flow flex column, width animates open/closed.
-->

<!-- Sidebar panel -->
<aside
	class="
		fixed top-0 left-0 h-full z-40 overflow-hidden bg-stone-900 text-stone-100
		transition-all duration-200
		{open ? 'w-56' : 'w-0'}
		md:sticky md:top-0 md:h-screen md:flex-shrink-0
	"
>
	<div class="w-56 h-full overflow-y-auto p-5">
		<!-- Desktop close button -->
		<button
			class="hidden md:flex items-center gap-2 text-stone-400 hover:text-stone-100 text-xs font-mono tracking-widest uppercase mb-4 mt-1"
			onclick={() => (open = false)}
		>
			✕ <span>Close</span>
		</button>

		<p class="text-xs tracking-widest uppercase text-stone-400 font-mono font-bold mb-3 mt-8 md:mt-0">
			Past Editions
		</p>
		<nav>
			<ul class="space-y-1">
				{#each editions as edition}
					<li>
						<a
							href="/{edition.date}"
							class="block px-3 py-2 text-sm font-mono whitespace-nowrap
								{currentDate === edition.date
								? 'bg-stone-100 text-stone-900 font-bold'
								: 'text-stone-300 hover:bg-stone-700 hover:text-stone-100'}"
							onclick={() => { if (window.innerWidth < 768) open = false; }}
						>
							{formatShort(edition.date)}
						</a>
					</li>
				{/each}
			</ul>
		</nav>
	</div>
</aside>

<!-- Mobile backdrop -->
{#if open}
	<div
		class="md:hidden fixed inset-0 bg-black/50 z-30"
		onclick={() => (open = false)}
		role="presentation"
	></div>
{/if}
