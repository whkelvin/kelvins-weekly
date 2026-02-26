<script lang="ts">
	import '../../app.css';

	let { children } = $props();
</script>

<div class="min-h-screen bg-stone-200">
	{@render children()}
</div>
