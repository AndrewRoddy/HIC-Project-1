<script lang="ts">
  import '../app.css';
  import favicon from '$lib/assets/favicon.svg';
  import Navbar from '$lib/components/Navbar.svelte';
  import Footer from '$lib/components/Footer.svelte';
  import {
    getPrice,
    loadCart
  } from '$lib/state/cart.svelte';
  import { onMount } from 'svelte';
  import Hotkeys from '$lib/components/Hotkeys.svelte';

  const total = $derived(getPrice());

  let { children } = $props();

  onMount(() => {
    loadCart();
  });
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

<page>
  <Navbar {total} />
  <Hotkeys />

  <content>
    {@render children()}
  </content>

  <Footer />
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

  content {
    margin: 1em;
  }
</style>
