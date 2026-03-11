<script lang="ts">
</script>

<section class="my-20 space-y-12">
  <div class="text-center space-y-4 max-w-2xl mx-auto">
    <h2 class="text-2xl md:text-3xl font-extrabold font-mono text-fg uppercase tracking-tighter leading-none">
      Engineered for Speed
    </h2>
    <p class="text-base text-fg1 font-bold leading-snug">
      Every entry is structured so you can triage the industry's most important engineering content in minutes, not hours.
    </p>
  </div>

  <!-- Two-column: Entry on left, Explanations on right -->
  <div class="max-w-4xl mx-auto grid grid-cols-1 md:grid-cols-[1fr_auto_1fr] gap-0 md:gap-0 items-stretch font-mono">

    <!-- LEFT: Mock Entry -->
    <div class="border-2 border-fg p-5 bg-card-bg space-y-5">
      <div class="text-[10px] font-bold uppercase tracking-widest text-fg2 mb-2">Sample Entry</div>

      <!-- Link part -->
      <div class="border-l-4 border-fg pl-4" id="entry-link">
        <div class="text-fg font-extrabold text-base underline decoration-2 underline-offset-4">
          Scaling Inference with Chain-of-Thought
        </div>
      </div>

      <!-- Why part -->
      <div class="border-l-4 border-fg1 pl-4" id="entry-why">
        <p class="text-fg1 font-bold text-sm italic">
          "Shift from training-heavy to inference-heavy compute marks the next major architectural moat for AI-native apps."
        </p>
      </div>

      <!-- Description part -->
      <div class="border-l-4 border-fg2 pl-4" id="entry-desc">
        <p class="text-fg2 text-xs leading-relaxed">
          OpenAI's latest benchmarks show that reasoning models spend more time 'thinking' to solve complex coding tasks. For developers, this means latency budgets must shift toward smarter agents rather than faster UI.
        </p>
      </div>
    </div>

    <!-- MIDDLE: Arrows (desktop only) -->
    <div class="hidden md:flex flex-col justify-around h-full py-8 px-2 text-fg2 font-mono text-sm">
      <div class="flex items-center"><span>---&gt;</span></div>
      <div class="flex items-center"><span>---&gt;</span></div>
      <div class="flex items-center"><span>---&gt;</span></div>
    </div>

    <!-- RIGHT: Explanations -->
    <div class="flex flex-col justify-around h-full space-y-6 md:space-y-0 md:py-2 mt-6 md:mt-0">
      <div class="flex-1 flex items-center">
        <dl class="border border-fg border-dotted p-4 bg-card-bg w-full">
          <dt class="text-sm font-extrabold text-fg mb-2 uppercase tracking-wider">Link</dt>
          <dd class="text-sm text-fg leading-relaxed">Direct link to the original post. Content sourced from top-tier engineering teams.</dd>
        </dl>
      </div>
      <div class="flex-1 flex items-center">
        <dl class="border border-fg border-dotted p-4 bg-card-bg w-full">
          <dt class="text-sm font-extrabold text-fg mb-2 uppercase tracking-wider">Why</dt>
          <dd class="text-sm text-fg leading-relaxed">A 1-sentence strategic filter. Quickly gauge if this resource is worth your time.</dd>
        </dl>
      </div>
      <div class="flex-1 flex items-center">
        <dl class="border border-fg border-dotted p-4 bg-card-bg w-full">
          <dt class="text-sm font-extrabold text-fg mb-2 uppercase tracking-wider">Key Takeaway</dt>
          <dd class="text-sm text-fg leading-relaxed">The core engineering insight, extracted. No fluff, just the facts.</dd>
        </dl>
      </div>
    </div>
  </div>

</section>
