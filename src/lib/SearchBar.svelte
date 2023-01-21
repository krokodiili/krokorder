<script lang="ts">
	export let onChange: (event: Event) => void;
</script>

<input
	on:input={onChange}
	class="rounded-lg p-2 my-2 w-full max-w-4xl text-black"
	placeholder="Hae.."
/>
