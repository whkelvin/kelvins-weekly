<script lang="ts">
  import type { Repo } from "$lib/types";
  let { repos }: { repos: Repo[] } = $props();
</script>

<section class="mt-6">
  <h2 class="section-heading">Trending on GitHub</h2>
  <ul class="space-y-5">
    {#each repos as repo}
      <li>
        <a
          href={repo.url}
          target="_blank"
          rel="noopener noreferrer"
          class="block group"
        >
          <div class="flex items-baseline justify-between gap-2">
            <p class="yizy-title group-hover:underline">{repo.name}</p>
            <span class="yizy-description whitespace-nowrap flex-shrink-0"
              >★ {repo.starsThisWeek.toLocaleString()}</span
            >
          </div>
        </a>
        <!--
        <p class="yizy-subtitle mt-1">{repo.why}</p>
        <p class="yizy-description mt-1">{repo.description}</p>
        -->
      </li>
    {/each}
  </ul>
</section>
