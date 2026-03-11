<script lang="ts">
  import StampIcon from '$lib/components/StampIcon.svelte';
</script>

<section class="my-20 py-12 border-y-2 border-fg">
  <div class="max-w-3xl mx-auto">
    <div class="mb-8 flex items-center gap-4">
      <h2
        class="text-2xl md:text-3xl font-extrabold font-mono text-fg uppercase tracking-tighter leading-none"
      >
        Kelvin's Pick
      </h2>
      <StampIcon size={36} />
    </div>

    <div class="grid grid-cols-1 md:grid-cols-5 gap-10 items-start">
      <div class="md:col-span-3 space-y-6">
        <p class="text-base text-fg1 font-bold leading-snug">
          Beyond the curated industry news, every edition includes a personal
          recommendation — tools I actually use in my workflow, or news I find
          genuinely useful and interesting.
        </p>

        <div class="space-y-4">
          <div class="flex gap-3">
            <span class="flex-shrink-0 text-fg font-bold text-sm">></span>
            <p class="text-sm text-fg2 font-mono">
              <span class="font-bold text-fg">Tools I use:</span> The IDEs, CLI tools,
              and libraries that are part of my daily workflow.
            </p>
          </div>
          <div class="flex gap-3">
            <span class="flex-shrink-0 text-fg font-bold text-sm">></span>
            <p class="text-sm text-fg2 font-mono">
              <span class="font-bold text-fg">Frontier news:</span> High-interest
              items from labs and teams that aren't yet mainstream.
            </p>
          </div>
          <div class="flex gap-3">
            <span class="flex-shrink-0 text-fg font-bold text-sm">></span>
            <p class="text-sm text-fg2 font-mono">
              <span class="font-bold text-fg">Personally vetted:</span> Not an automated
              list. Every pick is reviewed for quality and impact.
            </p>
          </div>
        </div>
      </div>

      <div class="md:col-span-2">
        <div class="bg-fg p-1 shadow-[6px_6px_0px_var(--theme-border)]">
          <div class="bg-card-bg p-6 border border-fg border-dashed">
            <div class="text-center space-y-3">
              <p
                class="text-lg font-extrabold font-mono text-fg uppercase tracking-tight"
              >
                Kelvin's Pick
              </p>
              <p class="text-sm italic text-fg2 leading-relaxed">
                "Taste has become the #1 asset in an AI-driven world. Kelvin's
                pick is a goodie guarantee."
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
