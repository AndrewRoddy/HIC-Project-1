<script lang="ts">
  import '../../app.css';
  import { page } from '$app/state';
<<<<<<< HEAD
  import Bagel from '$lib/components/Bagel.svelte';
  import { cost } from '$lib/state/cost.svelte.js';

  const path = $derived(
    page.url.searchParams.get('path')?.split('/').pop() || 'Cinnamon-Raisin-Bagel.webp'
=======
  import Bagel from '../../lib/components/Bagel.svelte';
  const path = $derived(
    page.url.searchParams.get('path')?.split('/').pop() ||
      'Cinnamon-Raisin-Bagel.webp'
  );
  const name = $derived(
    page.url.searchParams.get('name') ?? 'Regular Bagel'
  );
  const price = $derived(
    Number(page.url.searchParams.get('price') ?? 99.99)
>>>>>>> ec9a8fa (1200 dollars worth of bagels)
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
<<<<<<< HEAD
  <Bagel
    img={path}
    name={name}
    price={price}
  />

  <button class="add-to-cart-button" type="button" onclick={buyBagel}>Add to Cart</button>
</div>

=======
  <Bagel img={path} {name} {price} />
</div>
>>>>>>> ec9a8fa (1200 dollars worth of bagels)

<style>
  .page-header {
    text-align: left;
    padding-left: 0.75em;
<<<<<<< HEAD
    color: var(--text)
=======
    color: var(--text);
>>>>>>> ec9a8fa (1200 dollars worth of bagels)
  }

  .bagel-section {
    padding: 1em;
<<<<<<< HEAD
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
=======
>>>>>>> ec9a8fa (1200 dollars worth of bagels)
  }
</style>
