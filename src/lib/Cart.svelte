<script lang="ts">
	import { cart, cartList } from '../stores';
	import { Button } from '$lib';

	let isOpen = true;
	const handleOrder = () => {
		cart.order();
	};
</script>

<div class="fixed flex justify-end bottom-0 w-full max-w-[400px] right-6">
	{#if $cartList.length}
		{#if isOpen}
			<div class="bg-black w-full p-2 py-2 px-2">
				<div class="flex justify-between items-center pr-2">
					<h5>Ostoskori</h5>
					<Button class="rounded-full h-10 w-10" onClick={() => (isOpen = false)}>x</Button>
				</div>
				<hr />
				<div class="overflow-y-auto max-h-[300px]">
					{#each $cartList as { item, quantity }, i}
						<div class="flex justify-between px-4 items-center">
							{item.name}
							x {quantity}
							<Button onClick={() => cart.removeFromCart(item.id)}>x</Button>
						</div>
					{/each}
				</div>
				<hr />
				<div class="mx-6"><Button class="w-full" onClick={handleOrder}>Tilaa</Button></div>
			</div>
		{:else}
			<Button onClick={() => (isOpen = true)}>Ostoskorissa {$cartList.length}</Button>
		{/if}
	{/if}
</div>
