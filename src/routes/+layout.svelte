<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<page>
    <navbar>
        <a href="./">Home</a>(h)
        <a href="./order">Order</a>(o)
        <a href="./rewards">Rewards</a>(r)
    </navbar>

    <content>
        {@render children()}
    </content>

    <footer>
        <h1>Amazing Footer!</h1>
    </footer>
</page>

<style>
    :global(body) {
        margin: 0;
    }

    page {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        color: goldenrod;
    }

    navbar {
        margin: 0em;
        padding: 0.5em;
        justify-content: center;
        background-color: #eeeeee;
        display: flex;
        gap: 1em;
        text-align: center;
        align-content: center;

        a {
            font-size: 3em;
        }
    }

    footer {
        margin: 0em;
        padding: 0em;
        text-align: center;
        background-color: #eeeeee;
    }

    content {
        margin: 1em;
    }
</style>
