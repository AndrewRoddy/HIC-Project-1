<script lang="ts">
  import { onMount } from 'svelte';
  import { resolve } from '$app/paths';
  import {
    orders,
    loadOrders
  } from '$lib/state/orders.svelte';
  import { SvelteDate } from 'svelte/reactivity';

  let ready = $state(false);
  let errorMessage = $state('');

  onMount(() => {
    try {
      loadOrders();
    } catch (error) {
      console.error(
        'Could not load order history: ',
        error
      );
      errorMessage =
        "We coudn't load your saved order history.";
    } finally {
      ready = true;
    }
  });
</script>

<h1 class="page-header">Order History</h1>

{#if !ready}
  <p>Loading your orders...</p>
{:else if errorMessage}
  <p role="alert">{errorMessage}</p>
{:else if orders.items.length === 0}
  <p>You don't have any orders yet.</p>
  <a href={resolve('/order')}>Order some bagels!</a>
{:else}
  <div class="orders">
    {#each orders.items as order (order.id)}
      <article class="order">
        <h2>
          Order - {new SvelteDate(
            order.createdAt
          ).toLocaleString()}
        </h2>

        <ul class="order-list">
          {#each order.items as item (item.id)}
            <li>
              <p>
                ${(item.quantity * item.price).toFixed(2)} | {item.name}
                × {item.quantity}
              </p>
            </li>
          {/each}
          {#if order.freeBagels}
            <li>
              <p>
                -${(order.discount ?? 0).toFixed(2)} | Free bagels
                × {order.freeBagels}
              </p>
            </li>
          {/if}
        </ul>

        <hr class="solid" style="width: 25%; margin: 0;" />

        <p>
          ${order.total.toFixed(2)} -
          {order.itemCount}
          {order.itemCount === 1 ? 'item' : 'items'}
        </p>
      </article>
    {/each}
  </div>
{/if}

<style>
  .page-header {
    color: var(--text);
    text-align: left;
    padding-left: 0.75em;
  }
  h2,
  p,
  li {
    color: var(--text);
  }

  a {
    color: var(--text);
  }

  .orders {
    display: grid;
    padding-left: 1.5em;
    gap: 1em;
  }

  .order {
    padding: 1em;
    background-color: var(--surface);
    border: 1px solid var(--accent);
    border-radius: 0.5em;
  }

  h2 {
    margin-top: 0;
    font-size: 1.25em;
  }

  li {
    margin-bottom: 0.5em;
  }

  .order-list {
    list-style-type: none;
    margin: 0;
    padding-left: 0;
    align-items: center;
    gap: 40px;
  }
</style>