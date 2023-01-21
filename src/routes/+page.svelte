<script lang="ts">
	import type { PageServerData } from './$types';
	import { Menu } from '$lib';
	import SearchBar from '$lib/SearchBar.svelte';
	import { debounce } from 'debounce';
	import { trpc } from '$lib/trpc/client';
	export let data: PageServerData;
	const debo = debounce(getMenuItems, 500);

	function getMenuItems(query: string) {
		trpc().menu.query({ text: query });
	}

	function handleChange(event: Event) {
		const target = event.target as HTMLFormElement;
		debo(target.value);
	}
</script>

<div>
	<div class="flex justify-center">
		<SearchBar onChange={handleChange} />
	</div>
	<Menu items={data.menu} />
</div>
