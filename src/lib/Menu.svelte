<script lang="ts">
	import type { MenuItem } from 'src/types';
	import { Button } from '$lib';
	import { cart } from '../stores';

	function handleClick(item: MenuItem) {
		console.log('hahahhaha', item);
		cart.addToCart(item);
	}

	export let items: MenuItem[];
</script>

<div class="grid grid-cols-2 gap-3">
	{#if items}
		{#each items as item}
			<div class="flex bg-green-800 rounded-md">
				<img class="w-[300px] rounded-t-md object-cover  my-0" src={item.image} alt={item.name} />
				<div class="px-4 py-2">
					<div class="flex justify-between items-center pb-2">
						<h3 class="my-0">{item.name}</h3>
						<p class="my-0 font-bold text-orange-300">{item.price}e</p>
					</div>
					<p class="my-2">{item.description}</p>
					<div class="flex flex-wrap gap-2">
						{#each item.tags as tag}
							<div class="bg-gray-500 rounded-lg px-2 whitespace-nowrap">{tag}</div>
						{/each}
					</div>
					<div class="w-full flex justify-center">
						<Button onClick={() => handleClick(item)}>+5</Button>
					</div>
				</div>
			</div>
		{/each}
	{/if}
</div>
