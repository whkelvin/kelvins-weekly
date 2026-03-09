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
  class="font-jetbrains border-b-4 border-fg pb-4 mb-6 text-center"
>
  <p class="text-xs tracking-widest uppercase text-fg2 mb-2 font-mono">
    {formatDate(date)}
  </p>
  <h1
    class="text-5xl md:text-7xl font-mono tracking-tight text-fg font-extrabold leading-none"
  >
    Kelvin's Weekly
  </h1>
  <div class="mt-3 border-t border-b border-border py-2">
    <p
      class="text-base md:text-lg font-bold font-mono text-fg2 tracking-wide"
    >
      <span class="text-fg2">/*</span>
      <span class="mx-2">
        Feeling left behind as a software developer? Stay ahead at
        weekly.yizy.dev
      </span>
      <span class="text-fg2">*/</span>
    </p>
  </div>
</header>
