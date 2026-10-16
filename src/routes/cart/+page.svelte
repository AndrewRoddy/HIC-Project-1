<script lang="ts">
  import Bagel from '$lib/components/Bagel.svelte';
  import {
    cart,
    removeItem,
    countItems,
    getPrice,
    modifyQuantity,
    loadCart,
    undoCartChange,
    confirmCheckout
  } from '$lib/state/cart.svelte';
  import { resolve } from '$app/paths';
  import { goto } from '$app/navigation';
  import { page } from '$app/state';
  import { onMount } from 'svelte';
  import {
    loadRewards,
    freeAvailable,
    discountFor
  } from '$lib/state/rewards.svelte';

  const itemCount = $derived(countItems());
  const total = $derived(getPrice());

  // free bagels: use as many as are available, up to the bagels in the cart
  let useFree = $state(false);
  const freeCount = $derived(Math.min(freeAvailable(), itemCount));
  const discount = $derived(
    useFree ? discountFor(cart.items, freeCount) : 0
  );

  let feedback = $state('');
  let canUndo = $state(false);
  let navigating = $state(false);
  let loaded = $state(false);

  onMount(() => {
    loadRewards();
    loadCart();
    loaded = true;
  });

  function deleteItem(id: number) {
    const item = cart.items.find((item) => item.id === id);
    if (!item) return;

    const name = item.name;
    removeItem(id);

    feedback = `Removed ${name} from yor cart.`;
    canUndo = true;
  }

  function changeQuantity(id: number, change: number) {
    const item = cart.items.find((item) => item.id === id);
    if (!item || item.quantity + change < 1) return;

    modifyQuantity(id, change);

    feedback = '';
    canUndo = true;
  }

  function undoChange() {
    if (undoCartChange()) {
      feedback = 'Your last cart change was undone.';
    }
    canUndo = false;
  }

  async function checkout() {
    if (!loaded || navigating) return;

    if (itemCount === 0) {
      feedback = 'Your cart is empty. Add some bagels before checking out!';
      return;
    }

    const finalTotal = total - discount;

    const confirmed = window.confirm(
      `Place your order for ${itemCount} ${itemCount === 1 ? 'bagel' : 'bagels'

      }?\n\nTotal: $${finalTotal.toFixed(2)}`
    );

    if (!confirmed) {
      feedback = 'Order not placed. You can keep editig your cart.';
      return;
    }

    confirmCheckout(useFree ? freeCount : 0);
    navigating = true;

    try {
      await goto(resolve('/checkout'));
    } catch (error) {
      console.error('Could not open checkout: ', error);
      feedback = 'Could not open checkout. Please try again.';
    } finally {
      navigating = false;
    }
  }
</script>

<svelte:head>
  <title>Cart | Bagl</title>
</svelte:head>

<h1 class="page-header">My Cart</h1>

{#if page.url.searchParams.get('reason') === 'empty-cart'}
  <p class="cart-notice" role="status">
    Checkout is not available because your cart is empty.
    Add some
    <a href={resolve('/order')}>bagels</a>
    before placing an order!
  </p>
{/if}

{#if page.url.searchParams.get('reason') === 'not-confirmed'}
  <p class="cart-notice" role="status">
    Your order has not been placed! Review your cart and select 
    Checkout to confirm it.
  </p>
{/if}

<div class="cart-feedback">
  <p role="status">{feedback}</p>

  {#if canUndo}
    <button type="button" onclick={undoChange}>
      Undo last change
    </button>
  {/if}
</div>

<div class="cart">
  <section class="cart-items" aria-labelledby="cart-title">
    <ul class="cart-list">
      {#each cart.items as item (item.id)}
        <li class="cart-item">
          <Bagel
            id={item.id}
            img={item.img}
            name={item.name}
            price={item.price}
          />

          <div class="controls">
            <div class="quantity">
              <button
                type="button"
                disabled={item.quantity <= 1}
                onclick={() => changeQuantity(item.id, -1)}
                >-</button
              >

              <span>{item.quantity}</span>

              <button
                type="button"
                onclick={() => changeQuantity(item.id, 1)}
                >+</button
              >
            </div>

            <button
              class="delete-button"
              type="button"
              onclick={() => deleteItem(item.id)}
            >
              Delete
            </button>
          </div>
        </li>
      {:else}
        <li
          style="color: var(--text-muted); padding: 0.75em;"
        >
          Your cart is empty.
        </li>
      {/each}
    </ul>
  </section>

  <aside
    class="cart-summary"
    aria-labelledby="summary-title"
  >
    <h2 id="summary-title">Order Summary</h2>
    <p>
      Items Quantity:
      {itemCount}
    </p>
    <p>Subtotal: ${total.toFixed(2)}</p>

    {#if freeCount > 0}
      <label class="free-toggle">
        <input type="checkbox" bind:checked={useFree} />
        Use {freeCount} free {freeCount === 1 ? 'bagel' : 'bagels'}
      </label>
    {/if}

    {#if useFree && discount > 0}
      <p>Free bagels: -${discount.toFixed(2)}</p>
      <p>Total: ${(total - discount).toFixed(2)}</p>
    {/if}

    <button 
      class="checkout-button"
      type="button"
      disabled={!loaded || itemCount === 0 || navigating}
      onclick={checkout}  
    >
      {navigating ? 'Opening...' : 'Checkout'}
    </button>
  </aside>
</div>

<style>
  .cart-notice {
    padding: 1em;
    margin-left: 1.25em;
    width: 620px;
    color: var(--text);
    background-color: var(--surface);
    border: 1px solid var(--accent);
    border-radius: 0.5em;
  }

  .cart-notice a {
    color: var(--accent);
    text-decoration: underline;
    text-decoration-style: 0.15em;
  }

  .cart-notice a:hover {
    color: var(--accent-hover);
  }

  h2 {
    color: var(--text);
  }

  .page-header {
    color: var(--text);
    text-align: left;
    padding-left: 0.75em;
  }

  .cart {
    display: grid;
    grid-template-columns: minmax(0, 1fr) 300px;
    gap: 40px;
    align-items: start;
    padding: 1em;
  }

  .cart-list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 40px;
  }

  .free-toggle {
    display: flex;
    align-items: center;
    gap: 0.5em;
    margin: 0.5em 0;
    cursor: pointer;
  }

  .cart-summary {
    padding: 24px;
    background-color: var(--surface);
    border-radius: 1em;
    color: var(--text);
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
    min-width: 20px;
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

  .checkout-button {
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

  .checkout-button:disabled {
    opacity: 0.35;
    cursor: not-allowed;
  }

  .cart-feedback {
    margin: 0 1.25em 1em;
    color: var(--text);
  }

  .cart-feedback p:empty {
    margin: 0;
  }

  .cart-feedback button {
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