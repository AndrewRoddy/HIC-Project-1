<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<h1>
    <a href="./">Home</a>(h)
    <a href="./about">About</a>(a)
</h1>

{@render children()}

<h1>Amazing Footer!</h1>
