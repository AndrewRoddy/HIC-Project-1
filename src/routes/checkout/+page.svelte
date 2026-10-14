<script lang="ts">
    import {
        cart, 
        countItems,
        getPrice
    } from '$lib/state/cart.svelte';
    import { onMount } from 'svelte';

    const itemCount = countItems();
    const total = getPrice();
    const purchasedItems = cart.items.map(item => ({...item}));
    onMount(() => {
        cart.items = [];
    });
</script>

<h1 class="page-header">Order Summary</h1>
<h3>Thank you for placing an order!</h3>

<div class="order-summary">
    <ul class="order-list">
        {#each purchasedItems as item (item.id) }
            <li class="order-item">
                <p>${item.quantity * item.price} | {item.name} × {item.quantity}</p>
            </li>
        {/each}
    </ul>

    <hr class="solid" style="width: 50%; margin: 0;">

    <p>
        ${total.toFixed(2)} – 
        {itemCount}
        {#if itemCount === 1}
         item
        {:else}
         items
        {/if}
    </p>
</div>

<style>
    h3 {
        color: var(--text-muted);
        padding-left: 1.25em; 
        padding-bottom: 1em;
    }

    .page-header {
        color: var(--text);
        text-align: left;
        padding-left: 0.75em;
    }

    .order-summary {
        padding-left: 1.25em;
    }

    .order-summary p {
        color: var(--text);
    }

    .order-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
        /* display: flex;
        flex-wrap: wrap; */
        align-items: center;
        gap: 40px
    }
</style>
