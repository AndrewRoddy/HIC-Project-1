<script lang="ts">
  import favicon from '$lib/assets/favicon.svg';
  import Icon from '../lib/components/Icon.svelte';

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

<page>
  <navbar>
    <a href="./">bagl</a>
    <a href="./order">order</a>
    <a href="./rewards">rewards</a>
    <a href="./cart"><Icon name={'cart'} /></a>
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
  }

  navbar {
    margin: 0em;
    padding: 0.5em;
    justify-content: center;
    background-color: #282820;
    display: flex;
    gap: 2em;
    text-align: center;
    align-content: center;
    color: #ff922f;

    a {
      color: #ff922f;
      font-size: 3em;
      text-decoration: none;
    }
    a:hover {
      color: #ffad2f;
    }
  }

  footer {
    font-family: 'Open Sans';
    font-size: 5em;
    margin: 0em;
    padding: 0em;
    text-align: center;
    background-color: #eeeeee;
  }

  content {
    margin: 1em;
  }
</style>
