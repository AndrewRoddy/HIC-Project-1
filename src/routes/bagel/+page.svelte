<script lang="ts">
  import '../../app.css';
  import { page } from '$app/state';
  import Bagel from '$lib/components/Bagel.svelte';
  import { cost } from '$lib/state/cost.svelte.js';

  const path = $derived(
    page.url.searchParams.get('path')?.split('/').pop() || 'Cinnamon-Raisin-Bagel.webp'
  );
  const name = $derived(
    page.url.searchParams.get('name') ?? 'Regular Bagel'
  );
  const price = $derived(
    Number(page.url.searchParams.get('price') ?? 99.99)
  );

  function buyBagel() {
    cost.total += price;
  }
</script>

<h1 class="page-header">Bagel Info</h1>

<div class="bagel-section">
  <Bagel
    img={path}
    name={name}
    price={price}
  />

  <button class="add-to-cart-button" type="button" onclick={buyBagel}>Add to Cart</button>
</div>


<style>
  .page-header {
    text-align: left;
    padding-left: 0.75em;
    color: var(--text)
  }

  .bagel-section {
    padding: 1em;
    list-style: none;
    margin: 0;
    display: flex;
    align-items: top;
    gap: 40px;
  }

  .add-to-cart-button {
    width: 100px;
    height: 50px;
    border: none;
    border-radius: 1em;
    background-color: var(--accent);
    cursor: pointer;
  }
</style>
