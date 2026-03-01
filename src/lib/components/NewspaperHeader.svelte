<script lang="ts">
  let { date }: { date: string } = $props();

  function formatDate(d: string): string {
    return new Date(d + "T00:00:00").toLocaleDateString("en-US", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  }
</script>

<header
  class="font-jetbrains border-b-4 border-stone-900 pb-4 mb-6 text-center"
>
  <p class="text-xs tracking-widest uppercase text-stone-500 mb-2 font-mono">
    {formatDate(date)}
  </p>
  <h1
    class="text-5xl md:text-7xl font-mono tracking-tight text-stone-900 leading-none"
    style="font-weight: 800; -webkit-text-stroke: 1px #1c1917;"
  >
    Kelvin's Weekly
  </h1>
  <div class="mt-3 border-t border-b border-stone-400 py-2">
    <p
      class="text-base md:text-lg font-bold font-mono text-stone-500 tracking-wide"
    >
      <span class="text-stone-400">/*</span>
      <span class="mx-2">
        Feeling left behind as a software developer? Stay ahead at
        weekly.yizy.dev
      </span>
      <span class="text-stone-400">*/</span>
    </p>
  </div>
</header>
