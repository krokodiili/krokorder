<script lang="ts">
	import { cart } from '../stores';
	import { Button } from '$lib';

	let isOpen = true;
</script>

<div class="fixed bottom-1 w-full max-w-[400px] right-6">
	{#if isOpen}
		<div class="bg-black p-2">
			{#each $cart as item, i}
				<div class="py-2 px-2 flex justify-between items-center">
					{item.name}
					<Button onClick={() => cart.removeFromIndex(i)}>x</Button>
				</div>
			{/each}
		</div>
	{:else}
		<Button onClick={() => (isOpen = true)}>Ostoskorissa {$cart.length}</Button>
	{/if}
</div>
