<script lang="ts">
	export let onClick: () => void;
</script>

<button on:click={onClick} class="bg-primary text-black py-1 px-2 rounded-lg my-2">
	<slot />
</button>
