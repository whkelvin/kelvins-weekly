<script lang="ts">
  import type { Video } from "$lib/types";
  let { videos }: { videos: Video[] } = $props();
  let headline = $derived(videos[0]);
  let rest = $derived(videos.slice(1));
</script>

<section>
  <h2 class="section-heading">Videos</h2>

  {#if headline}
    <p class="yizy-title">{headline.title}</p>
    <p class="yizy-subtitle mt-1">{headline.why}</p>
    <div class="aspect-video w-full bg-stone-800 mt-2">
      <iframe
        src="https://www.youtube.com/embed/{headline.youtubeId}"
        title={headline.title}
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
        class="w-full h-full"
      ></iframe>
    </div>
    <p class="yizy-description mt-1.5">{headline.description}</p>
  {/if}

  {#if rest.length > 0}
    <ul class="space-y-5 mt-6">
      {#each rest as v}
        <li>
          <a
            href="https://www.youtube.com/watch?v={v.youtubeId}"
            target="_blank"
            rel="noopener noreferrer"
            class="block group"
          >
            <p class="yizy-title group-hover:underline">{v.title}</p>
          </a>
          <p class="yizy-subtitle mt-1">{v.why}</p>
          <div class="aspect-video w-full bg-stone-800 mt-2">
            <iframe
              src="https://www.youtube.com/embed/{v.youtubeId}"
              title={v.title}
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
              class="w-full h-full"
            ></iframe>
          </div>
          <p class="yizy-description mt-1.5">{v.description}</p>
        </li>
      {/each}
    </ul>
  {/if}
</section>
