<script lang="ts">
  import '../app.css';
  import favicon from '$lib/assets/favicon.svg';
  import Icon from '$lib/components/Icon.svelte';
  import Navbar from '$lib/components/Navbar.svelte';
  import { getPrice } from '$lib/state/cart.svelte';

  const total = $derived(getPrice());

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

<page>
  <Navbar {total} />

  <content>
    {@render children()}
  </content>

  <footer>
    <h1>BAGL</h1>
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
    background-color: var(--bg);
  }

  footer {
    flex-grow: 1;
    font-size: 5em;
    margin: 0em;
    padding: 0em;
    text-align: center;
    background-color: var(--bg-deep);
    color: var(--text);
    background-color: var(--bg-deep);
    border-top: 0.5px solid var(--border);
  }

  content {
    margin: 1em;
  }
</style>
