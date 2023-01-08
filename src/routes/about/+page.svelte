<script lang="ts">
	import type { PageServerData } from './$types';
	export let data: PageServerData;
</script>

<h6>Data loaded in<br /><code>+page.ts</code></h6>
<p>{data.users.map((user) => user.name)}</p>
<div>this is the about page</div>
