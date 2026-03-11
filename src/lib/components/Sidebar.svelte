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
		fixed top-0 left-0 h-full z-40 overflow-hidden bg-sidebar-bg text-sidebar-fg
		transition-all duration-200
		{open ? 'w-56' : 'w-0'}
		md:sticky md:top-0 md:h-screen md:flex-shrink-0
	"
>
	<div class="w-56 h-full overflow-y-auto p-5">
		<!-- Desktop close button -->
		<nav class="mb-8">
			<ul class="space-y-1">
				<li>
					<a
						href="/"
						class="block px-3 py-2 text-sm font-mono whitespace-nowrap uppercase tracking-widest
							{currentDate === 'home'
							? 'bg-sidebar-item-active text-sidebar-bg font-bold'
							: 'text-sidebar-fg hover:bg-sidebar-item-hover hover:text-sidebar-fg'}"
						onclick={() => { if (window.innerWidth < 768) open = false; }}
					>
						Home
					</a>
				</li>
			</ul>
		</nav>

		<p class="text-xs tracking-widest uppercase text-sidebar-fg font-mono font-bold mb-3 mt-8 md:mt-0">
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
								? 'bg-sidebar-item-active text-sidebar-bg font-bold'
								: 'text-sidebar-fg hover:bg-sidebar-item-hover hover:text-sidebar-fg'}"
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
