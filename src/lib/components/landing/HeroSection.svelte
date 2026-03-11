<script lang="ts">
  let { latestDate }: { latestDate: string } = $props();
</script>

<section class="border-b-2 border-fg pb-16 mb-16">
  <!-- ASCII Art -->
  <div class="text-center mb-10">
    <a href="/">
      <pre
        class="text-fg font-mono font-extrabold leading-none inline-block text-left mx-auto text-[0.2rem] sm:text-[0.45rem] md:text-[0.65rem] lg:text-[0.7rem]"
        aria-label="Kelvin's Weekly">{`
██╗  ██╗███████╗██╗    ██╗   ██╗██╗███╗   ██╗ ██╗███████╗    ██╗    ██╗███████╗███████╗██╗  ██╗██╗  ██╗   ██╗
██║ ██╔╝██╔════╝██║    ██║   ██║██║████╗  ██║ ╚═╝██╔════╝    ██║    ██║██╔════╝██╔════╝██║ ██╔╝██║  ╚██╗ ██╔╝
█████╔╝ █████╗  ██║    ██║   ██║██║██╔██╗ ██║    ███████╗    ██║ █╗ ██║█████╗  █████╗  █████╔╝ ██║   ╚████╔╝
██╔═██╗ ██╔══╝  ██║    ╚██╗ ██╔╝██║██║╚██╗██║    ╚════██║    ██║███╗██║██╔══╝  ██╔══╝  ██╔═██╗ ██║    ╚██╔╝
██║  ██╗███████╗██████╗ ╚████╔╝ ██║██║ ╚████║    ███████║    ╚███╔███╔╝███████╗███████╗██║  ██╗███████╗ ██║
╚═╝  ╚═╝╚══════╝╚═════╝  ╚═══╝  ╚═╝╚═╝  ╚═══╝    ╚══════╝     ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═╝`}</pre>
    </a>
    <div class="mt-3 border-t border-b border-border py-2">
      <p
        class="text-sm md:text-base font-bold font-mono text-fg2 tracking-wide"
      >
        <span class="text-fg2">/*</span>
        <span class="mx-2">Engineering Intelligence for Modern Developers</span>
        <span class="text-fg2">*/</span>
      </p>
    </div>
  </div>

  <!-- Value Proposition -->
  <div class="max-w-2xl mx-auto text-center space-y-8">
    <h1 class="text-base md:text-lg text-fg1 font-bold font-mono leading-snug">
      Curated engineering content delivered every Sunday — so you stay ahead
      without the noise.
    </h1>

    <div>
      <a
        href="/{latestDate}"
        class="inline-block bg-fg text-bg px-10 py-4 text-base font-extrabold font-mono uppercase tracking-wider hover:opacity-90 transition-all shadow-[6px_6px_0px_var(--theme-border)] active:translate-y-1 active:shadow-none"
      >
        Read the latest edition
      </a>
    </div>
  </div>
</section>
