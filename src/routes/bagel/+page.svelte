<script lang="ts">
  import '../../app.css';
  import { page } from '$app/state';
  const path = $derived(page.url.searchParams.get('path'));
  const name = $derived(page.url.searchParams.get('name'));
  const price = $derived(
    page.url.searchParams.get('price')
  );
</script>

<p>BAGELPAGE</p>
<button class="container" onclick={buyBagel}>
  <img src={path} class="bagel-image" alt=""/>
  <div class="text-area">
    <h1>{name}</h1>
    <h1>Bagel</h1>
    <h3>${price}</h3>
  </div>
</button>

<style>
  .container {
    /* Spae in bewteen the squares */
    margin: 0.3em;

    /* Centers bagel */
    text-align: center;

    /* Removes the button border */
    border: 0;

    /* Makes the div resize to the size of the text/bagel */
    display: inline-block;

    background-color: var(--accent);

    padding: 1em;
    border-radius: 1em;
  }

  .container:hover {
    background-color: var(--accent-hover);
    .bagel-image {
      transform: scale(1.05);
    }
  }

  .bagel-image {
    width: 15em;
    height: 15em;
    transition: all 0.1s ease;
  }

  .text-area {
    color: white;
    gap: 1em;
    text-align: center;

    h1,
    h3 {
      margin: 0;
      padding: 0;
    }
  }
</style>
