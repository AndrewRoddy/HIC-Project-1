<script lang="ts">
  import '../app.css';
  import favicon from '$lib/assets/favicon.svg';
  import Icon from '../lib/components/Icon.svelte';
  import { cost } from '../lib/state/cost.svelte.js';
  import { onMount } from 'svelte';

  let { children } = $props();

  // Loads in the cost variable
  // True if page loaded cost
  let ready = $state(false);
  onMount(() => (ready = true));
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

<page>
  <navbar>
    <a href="./">bagl</a>
    <a href="./order">order</a>
    <a href="./rewards">rewards</a>
    <a href="./cart" class="price-container">
      <Icon
        name={'cart'}
        fillColor="var(--accent)"
        hoverColor="var(--accent-hover)"
      />
      <div class="price">${ready ? cost.total : '...'}</div>
    </a>
  </navbar>

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

  navbar {
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

    a {
      color: var(--accent);
      font-size: 3em;
      text-decoration: none;
      display: flex;
    }
    a:hover {
      color: var(--accent-hover);
    }
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
