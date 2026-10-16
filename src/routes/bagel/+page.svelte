<script lang="ts">
  import '../../app.css';
  import { page } from '$app/state';
  import Bagel from '$lib/components/Bagel.svelte';
  import {
    buyBagel,
    cart,
    removeItem,
    modifyQuantity,
    undoCartChange
  } from '$lib/state/cart.svelte';

  const path = $derived(
    page.url.searchParams.get('path')?.split('/').pop() ||
      'Cinnamon-Raisin-Bagel.webp'
  );
  const name = $derived(
    page.url.searchParams.get('name') ?? 'Regular Bagel'
  );
  const price = $derived(
    Number(page.url.searchParams.get('price') ?? 99.99)
  );
  const id = $derived(
    Number(page.url.searchParams.get('id'))
  );
  const cal = $derived(
    Number(page.url.searchParams.get('cal') ?? 280)
  );
  const cartItem = $derived(
    cart.items.find((item) => item.id === id)
  );

  let feedback = $state('');
  let canUndo = $state(false);

  function addToCart() {
    if (!page.url.searchParams.get('id')) return;

    buyBagel({
      id,
      name,
      img: path,
      price
    });

    feedback = `Added ${name} to your cart.`;
    canUndo = true;
  }

  function deleteItem() {
    if (!cartItem) return;

    removeItem(cartItem.id);

    feedback = `Removed ${name} from your cart.`;
    canUndo = true;
  }

  function changeQuantity(change: number) {
    if (!cartItem || cartItem.quantity + change < 1) return;

    modifyQuantity(cartItem.id, change);

    feedback = '';
    canUndo = true;
  }

  function undoChange() {
    const restored = undoCartChange();

    feedback = restored ? 'Your last cart change was undone.' 
    : 'There is no cart change available to undo.'

    canUndo = false;
  }
</script>

<svelte:head>
  <title>{name} | Bagl</title>
</svelte:head>

<h1 class="page-header">Bagel Info</h1>

<div class="bagel-section">
  <Bagel {id} img={path} {name} {price} {cal} />
  <div>
    <h3 class="page-text">{cal} cal</h3>

    {#if cartItem}
      <p style="color: var(--text);">In your cart:</p>
      <div class="controls">
        <div class="quantity">
          <button
            type="button"
            disabled={cartItem.quantity <= 1}
            onclick={() => changeQuantity(-1)}
            >-</button
          >

          <span>{cartItem.quantity}</span>

          <button
            type="button"
            onclick={() => changeQuantity(1)}
            >+</button
          >
        </div>

        <button
          class="delete-button"
          type="button"
          onclick={deleteItem}
        >
          Delete
        </button>
      </div>
    {:else}
      <button
        class="add-to-cart-button"
        type="button"
        disabled={!page.url.searchParams.get('id')}
        onclick={addToCart}
      >
        Add to Cart
      </button>
    {/if}
    <div class="bagel-feedback">
  <p role="status">{feedback}</p>

  {#if canUndo}
    <button type="button" onclick={undoChange}>
      Undo last change
    </button>
  {/if}
  </div>
  </div>
</div>

<style>
  .page-header {
    text-align: left;
    padding-left: 0.75em;
    color: var(--text);
  }

  .page-text {
    text-align: left;
    color: var(--text);
  }

  .bagel-section {
    padding: 1em;
    list-style: none;
    margin: 0;
    display: flex;
    align-items: top;
    gap: 40px;
  }

  .controls {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .quantity {
    width: 105px;
    display: flex;
    align-items: center;
    gap: 16px;
    border: 1px solid var(--accent);
    border-radius: 1em;
    padding: 4px;
    margin-bottom: 4px;
    font-family:
      'Trebuchet MS', 'Lucida Sans Unicode',
      'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  }

  .quantity button {
    width: 32px;
    height: 32px;
    border: none;
    border-radius: 50%;
    background-color: var(--accent);
    font-size: 22px;
    cursor: pointer;
  }

  .quantity button:disabled {
    opacity: 0.35;
    cursor: not-allowed;
  }

  .quantity span {
    min-width: 20 px;
    text-align: center;
    color: var(--text);
  }

  .delete-button {
    width: 80px;
    height: 38px;
    border: none;
    border-radius: 1em;
    background-color: var(--accent);
    cursor: pointer;
    font-family:
      'Trebuchet MS', 'Lucida Sans Unicode',
      'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  }

  .add-to-cart-button {
    width: 100px;
    height: 50px;
    border: none;
    border-radius: 1em;
    background-color: var(--accent);
    cursor: pointer;
    font-family:
      'Trebuchet MS', 'Lucida Sans Unicode',
      'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
  }

  .bagel-feedback {
    margin-top: 1em;
    color: var(--text);
  }

  .bagel-feedback p:empty {
    margin: 0;
  }

  .bagel-feedback button {
    min-width: 80px;
    min-height: 38px;
    padding: 0.5em 1em;
    border: 1px solid var(--accent);
    border-radius: 1em;
    background-color: var(--surface);
    cursor: pointer;
    font-family:
      'Trebuchet MS', 'Lucida Sans Unicode',
      'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    color: var(--text);
  }
</style>
