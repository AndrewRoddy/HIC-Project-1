<script lang="ts">
  import '../../app.css';
  import Icon from '$lib/components/Icon.svelte';

  import { loadCart } from '$lib/state/cart.svelte';
  import { onMount } from 'svelte';
  import { resolve } from '$app/paths';

  let { total = 0, show_hotkeys = false } = $props<{
    total?: number;
  }>();

  onMount(() => {
    loadCart();
  });
</script>

<div class="navbar">
  <a id="homeID" href={resolve('/')}>Bagl</a>
  <a id="orderID" href={resolve('/order')}>Order</a>
  <a id="rewardsID" href={resolve('/rewards')}>Rewards</a>
  <a
    id="cartID"
    href={resolve('/cart')}
    class="price-container"
  >
    <Icon
      name="cart"
      fillColor="var(--accent)"
      hoverColor="var(--accent-hover)"
    />
    <div class="price">
      ${total.toFixed(2)}
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
