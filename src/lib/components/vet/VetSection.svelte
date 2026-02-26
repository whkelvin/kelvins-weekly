<script lang="ts" generics="T">
	import { GripVertical } from "lucide-svelte";
	import type { VetItem } from "$lib/types";
	import type { Snippet } from "svelte";

	let {
		title,
		items = $bindable(),
		row,
	}: {
		title: string;
		items: VetItem<T>[];
		row: Snippet<[T, number]>;
	} = $props();

	let dragIdx = $state<number | null>(null);
	let overIdx = $state<number | null>(null);

	function onDragStart(e: DragEvent, idx: number) {
		dragIdx = idx;
		if (e.dataTransfer) {
			e.dataTransfer.effectAllowed = "move";
			e.dataTransfer.setData("text/plain", String(idx));
		}
	}

	function onDragOver(e: DragEvent, idx: number) {
		e.preventDefault();
		if (e.dataTransfer) e.dataTransfer.dropEffect = "move";
		overIdx = idx;
	}

	function onDrop(e: DragEvent, idx: number) {
		e.preventDefault();
		if (dragIdx !== null && dragIdx !== idx) {
			const next = [...items];
			const [moved] = next.splice(dragIdx, 1);
			next.splice(idx, 0, moved);
			items = next;
		}
		dragIdx = null;
		overIdx = null;
	}

	function onDragEnd() {
		dragIdx = null;
		overIdx = null;
	}

	function toggleRemove(idx: number) {
		items = items.map((item, i) =>
			i === idx ? { ...item, removed: !item.removed } : item,
		);
	}
</script>

<section class="mb-8">
	<div class="flex items-baseline justify-between mb-1">
		<h2 class="section-heading !mb-0">{title}</h2>
		<span class="text-xs font-mono text-stone-400">check to remove</span>
	</div>
	<div class="space-y-1">
		{#each items as item, i (i)}
			<div
				class="flex items-start gap-2 p-2 rounded transition-all
					{item.removed ? 'opacity-40' : ''}
					{overIdx === i && dragIdx !== i
					? 'border-t-2 border-stone-500'
					: 'border-t-2 border-transparent'}
					{dragIdx === i ? 'opacity-50' : ''}"
				draggable="false"
				role="listitem"
				ondragover={(e) => onDragOver(e, i)}
				ondrop={(e) => onDrop(e, i)}
			>
				<!-- Grip handle -->
				<button
					class="cursor-grab active:cursor-grabbing text-stone-400 hover:text-stone-600 mt-0.5 shrink-0"
					draggable="true"
					ondragstart={(e) => onDragStart(e, i)}
					ondragend={onDragEnd}
					aria-label="Drag to reorder"
				>
					<GripVertical size={16} />
				</button>

				<!-- Remove checkbox -->
				<label class="mt-0.5 shrink-0 cursor-pointer" title="Remove from edition">
					<input
						type="checkbox"
						checked={item.removed}
						onchange={() => toggleRemove(i)}
						class="accent-red-600"
					/>
				</label>

				<!-- Content -->
				<div
					class="flex-1 min-w-0 {item.removed
						? 'line-through decoration-stone-400'
						: ''}"
				>
					{@render row(item.data, i)}
				</div>
			</div>
		{/each}
	</div>
</section>
