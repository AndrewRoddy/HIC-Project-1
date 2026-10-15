<script lang="ts">
  import '../app.css';
  import favicon from '$lib/assets/favicon.svg';
  import Navbar from '$lib/components/Navbar.svelte';
  import {
    getPrice,
    loadCart
  } from '$lib/state/cart.svelte';
  import { onMount } from 'svelte';

  const total = $derived(getPrice());

  let { children } = $props();

  onMount(() => {
    loadCart();
  });

  let is_b_down,
    is_o_down,
    is_r_down,
    is_c_down,
    is_alt_down = false;

  function key_action_runner(e) {
    switch (e.key) {
      case 'b':
        document.getElementById('homeID').click();
        break;
      case 'o':
        document.getElementById('orderID').click();
        break;
      case 'r':
        document.getElementById('rewardsID').click();
        break;
      case 'c':
        document.getElementById('cartID').click();
        break;
    }
    if (is_alt_down) {
      document.getElementById('cartID').click();
    }
  }

  function on_key_down(e) {
    if (e.repeat) return;

    switch (e.key) {
      case 'b':
        is_b_down = true;
        e.preventDefault();
        break;
      case 'o':
        is_o_down = true;
        e.preventDefault();
        break;
      case 'r':
        is_r_down = true;
        e.preventDefault();
        break;
      case 'c':
        is_c_down = true;
        e.preventDefault();
        break;
      case 'Alt':
        is_alt_down = true;
        e.preventDefault();
        break;
    }

    if (
      is_o_down ||
      is_b_down ||
      is_r_down ||
      is_c_down ||
      is_alt_down
    ) {
      key_action_runner(e);
    }
  }

  function on_key_up(e) {
    if (e.repeat) return;

    switch (e.key) {
      case 'Alt':
        is_alt_down = false;
        e.preventDefault();
        break;
    }
  }
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

<svelte:window
  on:keydown={on_key_down}
  on:keyup={on_key_up}
/>

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
