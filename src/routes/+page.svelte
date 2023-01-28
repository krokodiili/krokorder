<script lang="ts">
	import type { PageServerData } from './$types';
	import { Menu } from '$lib';
	import SearchBar from '$lib/SearchBar.svelte';
	import { debounce } from 'debounce';
	import { trpc } from '$lib/trpc/client';
	import type { MenuItem } from 'src/types';
	export let data: PageServerData;
	let updated: MenuItem[];
	const debo = debounce(getMenuItems, 500);

	async function getMenuItems(query: string) {
		const result = await trpc().menu.query({ text: query });
		updated = result;
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
	<Menu items={updated || data.menu} />
</div>
