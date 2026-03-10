<script lang="ts">
  import HeroSection from "$lib/components/landing/HeroSection.svelte";
  import SourcesSection from "$lib/components/landing/SourcesSection.svelte";
  import EntryGraphic from "$lib/components/landing/EntryGraphic.svelte";
  import KelvinsPickShowcase from "$lib/components/landing/KelvinsPickShowcase.svelte";
  import FeatureCards from "$lib/components/landing/FeatureCards.svelte";

  let { data } = $props();
</script>

<svelte:head>
  <title>Kelvin's Weekly — Curated Engineering Content from Top Tech Companies</title>
  <meta name="description" content="Stop drowning in tech news. Kelvin's Weekly curates the highest-signal engineering content from Anthropic, OpenAI, Vercel, and other frontier labs — with clear 'Why' context for every entry so you can triage in minutes." />
  <meta property="og:title" content="Kelvin's Weekly — Curated Engineering Content from Top Tech Companies" />
  <meta property="og:description" content="Curated engineering intelligence from the world's best engineering teams. One dispatch every Sunday." />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://weekly.yizy.dev" />
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="Kelvin's Weekly — Engineering Intelligence for Developers" />
  <meta name="twitter:description" content="Curated engineering content from Anthropic, OpenAI, Vercel, and frontier labs. One dispatch every Sunday." />
  {@html `<script type="application/ld+json">${JSON.stringify({
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "Kelvin's Weekly",
    "url": "https://weekly.yizy.dev",
    "description": "Curated engineering content from top tech companies for modern software developers.",
    "publisher": {
      "@type": "Person",
      "name": "Kelvin"
    }
  })}</script>`}
</svelte:head>

<main class="max-w-4xl mx-auto py-12 px-4 md:px-0">
  <!-- Section 1: ASCII Art Hero & Value Proposition -->
  <HeroSection latestDate={data.latestDate} />

  <!-- Section 2: Sources -->
  <SourcesSection />

  <!-- Section 3: Entry Anatomy — How each entry is structured -->
  <EntryGraphic />

  <!-- Section 3: Kelvin's Pick -->
  <KelvinsPickShowcase />

  <!-- Section 4: Time-Saving Features -->
  <FeatureCards />

  <!-- Section 5: Final CTA -->
  <section class="mt-12 pt-12 border-t-4 border-fg text-center">
    <p class="text-xs font-mono font-extrabold uppercase tracking-[0.2em] text-fg2 mb-6">Ready to dive in?</p>
    <a
      href="/{data.latestDate}"
      class="inline-block bg-fg text-bg px-12 py-5 text-xl font-extrabold font-mono uppercase tracking-tighter hover:opacity-90 transition-all shadow-[8px_8px_0px_var(--theme-border)] active:translate-y-1 active:shadow-none"
    >
      Read the latest dispatch
    </a>
    <p class="mt-6 text-[10px] font-mono text-fg2 uppercase tracking-widest">
      New edition every Sunday. Published from the frontier.
    </p>
  </section>
</main>
