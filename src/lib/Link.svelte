<script lang="ts">
	export let href: string;
	let className: string = '';
	export { className as class };

	import { page } from '$app/stores';
	import classNames from 'classnames';

	let pathname: string;

	$: pathname = $page.url.pathname;
</script>

<a
	{href}
	class={classNames('capitalize text-xl ml-2 font-bold font-display', className)}
	class:!text-primary={pathname === href}><slot /></a
>
