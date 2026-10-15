<script lang="ts">
  import '../../app.css';
  import Icon from '$lib/components/Icon.svelte';

  import { getPrice } from '$lib/state/cart.svelte';
  import { onMount } from 'svelte';
  import { resolve } from '$app/paths';

  let { total = 0.0 } = $props();

  // Loads in the cost variable
  // True if page loaded cost
  let ready = $state(false);
  onMount(() => (ready = true));
</script>

<div class="navbar">
  <a href="{resolve("/")}">Bagl</a>
  <a href="{resolve("/order")}">Order</a>
  <a href="{resolve("/rewards")}">Rewards</a>
  <a href="{resolve("/cart")}" class="price-container">
    <Icon
      name= 'cart'
      fillColor="var(--accent)"
      hoverColor="var(--accent-hover)"
    />
    <div class="price">
      ${ready ? total.toFixed(2) : '...'}
    </div>
  </a>
</div>

<style>
  .navbar {
    margin: 0em;
    padding: 0.5em;
    justify-content: center;
    display: flex;
    gap: 2em;
    text-align: center;
    align-content: center;

    /* Navbar colors */
    background-color: var(--bg-deep);
    border-bottom: 0.5px solid var(--border);
    color: var(--accent);
  }

  .navbar a {
    color: var(--accent);
    font-size: 3em;
    text-decoration: none;
    display: flex;
  }

  .navbar a:hover {
    color: var(--accent-hover);
  }

  .price {
    font-size: 0.5em;
  }

  .price-container {
    display: flex;
    vertical-align: middle;
    align-items: center;
    gap: 0.1em;
  }
</style>
