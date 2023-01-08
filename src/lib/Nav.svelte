<script lang="ts">
	import Link from '$lib/Link.svelte';
</script>

<div class="flex bg-glass px-8 h-[80px] sticky mb-2 justify-between items-center">
	<Link href="/" class="ml-0">
		<img src="/img/logo.png" class="w-[180px]" />
	</Link>

	<nav>
		<Link href="/">home</Link>
		<Link href="/about">about</Link>
		<Link href="/articles">articles</Link>
	</nav>
</div>
