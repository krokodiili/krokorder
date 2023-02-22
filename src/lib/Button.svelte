<script lang="ts">
	import classNames from 'classnames';

	export let onClick: () => void;
	let className = '';
	export { className as class };
</script>

<button
	on:click={onClick}
	class={classNames('whitespace-nowrap bg-primary text-black py-1 px-2 rounded-lg my-2', className)}
>
	<slot />
</button>
