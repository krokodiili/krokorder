<script lang="ts">
	import type { MenuItem } from 'src/types';
	import { Button } from '$lib';
	import { cart } from '../stores';

	function handleClick(item: MenuItem) {
		cart.addToCart(item);
	}

	export let items: MenuItem[];
</script>

<div class="mt-8 rounded-sm p-3 w-1/2 from-primary bg-gradient-to-r">
	<h2 class="my-0">Sushit</h2>
</div>
<div class="mt-2 grid grid-cols-2 gap-3">
	{#if items}
		{#each items as item}
			<div class="flex rounded-md">
				<img class="w-[80px] rounded-t-md object-cover  my-0" src={item.image} alt={item.name} />
				<div class="w-full px-4 py-2">
					<div class="flex justify-between items-center">
						<h3 class="my-0">{item.name}</h3>
						<p class="my-0 font-bold text-orange-300">{item.price}e</p>
					</div>
					<div class="flex justify-between items-start">
						<div>
							<p class="my-0">{item.description}</p>
							<div class="mt-1 flex flex-wrap gap-2">
								{#each item.tags as tag}
									<div class="bg-gray-500 rounded-lg px-2 whitespace-nowrap">{tag}</div>
								{/each}
							</div>
						</div>
						<Button onClick={() => handleClick(item)}
							>{item.baseQuantity === 1 ? 'Tilaa' : `Tilaa x${item.baseQuantity}`}</Button
						>
					</div>
				</div>
			</div>
		{/each}
	{/if}
</div>
