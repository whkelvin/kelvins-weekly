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

<NewspaperHeader date={edition.date} />

<div
  class="grid grid-cols-1 md:grid-cols-3 gap-0 md:gap-6 divide-y md:divide-y-0 md:divide-x divide-stone-300"
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

<KelvinsPick pick={edition.kelvinsPick} />
