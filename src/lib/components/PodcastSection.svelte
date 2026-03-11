<script lang="ts">
  import type { Podcast } from "$lib/types";
  import KelvinsPickTag from "$lib/components/KelvinsPickTag.svelte";
  let { podcasts }: { podcasts: Podcast[] } = $props();
</script>

<section>
  <h2 class="section-heading">Podcast</h2>
  <div class="space-y-5">
    {#each podcasts as podcast}
      <div>
        <p class="yizy-title">{podcast.title}</p>
        {#if podcast.kelvinsPick}<KelvinsPickTag />{/if}
        <p class="yizy-subtitle mt-1">{podcast.why}</p>
        <iframe
          data-testid="embed-iframe"
          src={podcast.spotifyEmbedUrl}
          title={podcast.title}
          width="100%"
          height="152"
          frameborder="0"
          allowfullscreen
          allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"
          loading="lazy"
          style="border-radius:12px"
          class="mt-2"
        ></iframe>
        <p class="yizy-description mt-1.5">{podcast.description}</p>
      </div>
    {/each}
  </div>
</section>
