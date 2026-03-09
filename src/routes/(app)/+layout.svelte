<script lang="ts">
	import "../../app.css";
	import favicon from "$lib/assets/favicon.svg";
	import Sidebar from "$lib/components/Sidebar.svelte";
	import { getEditions } from "$lib/data/index";
	import { page } from "$app/stores";
	import { browser } from "$app/environment";

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

	const themes = [{ value: "newspaper", label: "Newspaper" }, { value: "newspaper-dark", label: "Newspaper Dark" }, { value: "nord", label: "Nord" }];
	const THEME_KEY = "kw-theme";
	let theme = $state(browser ? (localStorage.getItem(THEME_KEY) ?? "newspaper") : "newspaper");
	let themeDropdownOpen = $state(false);

	if (browser) document.documentElement.dataset.theme = theme;

	function setTheme(value: string) {
		theme = value;
		document.documentElement.dataset.theme = value;
		localStorage.setItem(THEME_KEY, value);
		themeDropdownOpen = false;
	}
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<svelte:window onclick={(e) => {
	if (themeDropdownOpen && !(e.target as Element)?.closest('.relative')) {
		themeDropdownOpen = false;
	}
}} />

<div class="min-h-screen bg-bg flex">
	<Sidebar {editions} {currentDate} bind:open={sidebarOpen} />

	<div class="flex-1 min-w-0">
		<!-- Top bar with toggle button -->
		<div
			class="sticky top-0 z-20 bg-bg border-b border-border px-4 md:px-6 py-2 flex items-center justify-between gap-3"
		>
			<button
				class="flex items-center gap-2 text-fg2 hover:text-fg font-mono text-xs tracking-widest uppercase font-bold"
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
						? 'bg-fg text-bg'
						: 'text-fg hover:underline'}"
					>JetBrains Mono</button
				>
				<span class="text-fg2">/</span>
				<button
					onclick={() => setFont("noto")}
					class="px-2 py-1 tracking-wide transition-colors
						{font === 'noto'
						? 'bg-fg text-bg'
						: 'text-fg hover:underline'}"
					>Noto Sans</button
				>
				<!-- Custom theme picker -->
				<div class="relative ml-2">
					<button
						class="bg-bg text-fg border border-border font-mono text-xs px-2 py-1 flex items-center gap-1"
						onclick={() => (themeDropdownOpen = !themeDropdownOpen)}
					>
						{themes.find(t => t.value === theme)?.label}
						<span class="text-fg2">▾</span>
					</button>
					{#if themeDropdownOpen}
						<div class="absolute right-0 top-full mt-1 border border-border bg-bg z-50 min-w-full">
							{#each themes as t}
								<button
									class="block w-full text-left font-mono text-xs px-2 py-1 whitespace-nowrap
										{t.value === theme ? 'bg-fg text-bg' : 'text-fg hover:bg-fg hover:text-bg'}"
									onclick={() => setTheme(t.value)}
								>
									{t.label}
								</button>
							{/each}
						</div>
					{/if}
				</div>
			</div>
		</div>

		<main class="max-w-7xl mx-auto px-4 md:px-8 py-6">
			{@render children()}
		</main>
	</div>
</div>
