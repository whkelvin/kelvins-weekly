<script lang="ts">
	import "../../app.css";
	import favicon from "$lib/assets/favicon.svg";
	import Sidebar from "$lib/components/Sidebar.svelte";
	import { getEditions } from "$lib/data/index";
	import { page } from "$app/stores";

	let { children } = $props();

	const editions = getEditions();
	let currentDate = $derived($page.params.date ?? editions[0]?.date ?? "");
	let sidebarOpen = $state(false);

	type Font = "jetbrains" | "noto";
	let font = $state<Font>("jetbrains");

	function setFont(f: Font) {
		font = f;
		document.body.classList.toggle("font-noto-sans", f === "noto");
	}
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<div class="min-h-screen bg-stone-200 flex">
	<Sidebar {editions} {currentDate} bind:open={sidebarOpen} />

	<div class="flex-1 min-w-0">
		<!-- Top bar with toggle button -->
		<div
			class="sticky top-0 z-20 bg-stone-200 border-b border-stone-300 px-4 md:px-6 py-2 flex items-center justify-between gap-3"
		>
			<button
				class="flex items-center gap-2 text-stone-600 hover:text-stone-900 font-mono text-xs tracking-widest uppercase font-bold"
				onclick={() => (sidebarOpen = !sidebarOpen)}
			>
				<span class="text-base leading-none"
					>{sidebarOpen ? "✕" : "☰"}</span
				>
				<span class="hidden sm:inline"
					>{sidebarOpen ? "Hide" : "Editions"}</span
				>
			</button>

			<div class="flex items-center gap-1 text-xs font-mono">
				<button
					onclick={() => setFont("jetbrains")}
					class="px-2 py-1 tracking-wide transition-colors
						{font === 'jetbrains'
						? 'bg-stone-900 text-stone-100'
						: 'text-stone-500 hover:text-stone-900'}"
					>JetBrains Mono</button
				>
				<span class="text-stone-400">/</span>
				<button
					onclick={() => setFont("noto")}
					class="px-2 py-1 tracking-wide transition-colors
						{font === 'noto'
						? 'bg-stone-900 text-stone-100'
						: 'text-stone-500 hover:text-stone-900'}"
					>Noto Sans</button
				>
			</div>
		</div>

		<main class="max-w-7xl mx-auto px-4 md:px-8 py-6">
			{@render children()}
		</main>
	</div>
</div>
