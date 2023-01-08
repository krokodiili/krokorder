<script>
	import '../app.css';
	import Hero from '$lib/Hero.svelte';
	import Nav from '$lib/Nav.svelte';
	import Footer from '$lib/Footer.svelte';
</script>

<div
	class="prose flex flex-col justify-between prose-invert min-w-full bg-gradient-to-br from-[#111] to-bg min-h-screen"
>
	<div>
		<Nav />

		<Hero />
		<div class="min-w-full sm:p-4 md:p-8 sm:pt-0">
			<slot class="font-sans" />
		</div>
	</div>

	<Footer />
</div>
