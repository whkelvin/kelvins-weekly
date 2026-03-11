<script lang="ts">
  import type { Article } from "$lib/types";
  import KelvinsPickTag from "$lib/components/KelvinsPickTag.svelte";
  let { articles }: { articles: Article[] } = $props();
</script>

<section>
  <h2 class="section-heading">Blog Posts</h2>
  <ul class="space-y-5">
    {#each articles as article}
      <li>
        <a
          href={article.url}
          target="_blank"
          rel="noopener noreferrer"
          class="block group"
        >
          <p class="yizy-title group-hover:underline">{article.title}</p>
        </a>

        {#if article.kelvinsPick}<KelvinsPickTag />{/if}
        <div class="mt-1.5">
          <p class="yizy-subtitle">{article.why}</p>
          <p class="yizy-description mt-1">{article.description}</p>
        </div>
      </li>
    {/each}
  </ul>
</section>
