<script lang="ts">
	import type { MenuItem } from 'src/types';

	export let items: MenuItem[];
</script>

<div class="grid grid-cols-3 gap-3">
	{#each items as item}
		<div class="bg-green-800 rounded-md">
			<img
				class="w-full rounded-t-md object-cover h-[200px] my-0"
				src={item.image}
				alt={item.name}
			/>
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
			</div>
		</div>
	{/each}
</div>
