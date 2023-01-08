<script lang="ts">
	interface Data {
		title: string;
		date: string;
		content: any;
	}
	export let data: Data;
</script>

<article>
	<h1>{data.title}</h1>
	<p>Published: {data.date}</p>
	<svelte:component this={data.content} />
</article>
