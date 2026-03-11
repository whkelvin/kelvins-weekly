<script lang="ts">
  import type { PageData } from "./$types";
  import NewspaperHeader from "$lib/components/NewspaperHeader.svelte";
  import ArticleList from "$lib/components/ArticleList.svelte";
  import RepoList from "$lib/components/RepoList.svelte";
  import HeadlineVideo from "$lib/components/HeadlineVideo.svelte";
  import PodcastSection from "$lib/components/PodcastSection.svelte";
  import KelvinsPick from "$lib/components/KelvinsPick.svelte";

  let { data }: { data: PageData } = $props();
  let { edition } = $derived(data);
</script>

<svelte:head>
  <title>Kelvin's Weekly — {edition.date}</title>
  <meta property="og:title" content="Kelvin's Weekly — {edition.date}" />
  <meta property="og:description" content="Curated engineering content from top tech companies. One dispatch every Sunday." />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://weekly.yizy.dev/{edition.date}" />
  <meta property="og:image" content="https://assets.yizy.dev/kelvins-weekly.png" />
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="Kelvin's Weekly — {edition.date}" />
  <meta name="twitter:image" content="https://assets.yizy.dev/kelvins-weekly.png" />
</svelte:head>

<NewspaperHeader date={edition.date} />

<KelvinsPick pick={edition.kelvinsPick} />

<div
  class="grid grid-cols-1 md:grid-cols-3 gap-0 md:gap-6 divide-y md:divide-y-0 md:divide-x divide-border"
>
  <!-- Column 1: Articles + Repos — order 2 on mobile, 1 on desktop -->
  <div class="py-6 md:py-0 order-2 md:order-1 md:pr-6">
    <HeadlineVideo videos={edition.videos} />
  </div>

  <!-- Column 2: Videos — order 1 on mobile, 2 on desktop -->
  <div class="py-6 md:py-0 order-1 md:order-2 md:px-6">
    <ArticleList articles={edition.articles} />
  </div>

  <!-- Column 3: Podcasts + Repos — order 3 always -->
  <div class="py-6 md:py-0 order-3 md:pl-6">
    <PodcastSection podcasts={edition.podcasts} />
    <RepoList repos={edition.repos} />
  </div>
</div>
