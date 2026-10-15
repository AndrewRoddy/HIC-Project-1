<script lang="ts">
    import {
        cart, 
        countItems,
        getPrice,
        clearCart,

		loadCart

    } from '$lib/state/cart.svelte';
    import { onMount } from 'svelte';
    import { goto } from '$app/navigation';
    import { resolve } from '$app/paths';

    let purchasedItems = $state<typeof cart.items>([]);
    let itemCount = $state(0);
    let total = $state(0);
    let ready = $state(false);

    onMount(() => {
        loadCart();

        if (countItems() === 0) {
            // eslint-disable-next-line svelte/no-navigation-without-resolve
            void goto(`${resolve('/cart')}?reason=empty-cart`, {
                replaceState: true
            });
            return;
        }

        purchasedItems = cart.items.map((item) => ({...item}));
        itemCount = countItems();
        total = getPrice();

        clearCart();
        ready = true;
    });
</script>

{#if ready}
    <h1 class="page-header">Order Summary</h1>
    <h3>Thank you for placing an order!</h3>

    <div class="order-summary">
        <ul class="order-list">
            {#each purchasedItems as item (item.id) }
                <li class="order-item">
                    <p>${(item.quantity * item.price).toFixed(2)} | {item.name} × {item.quantity}</p>
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
{:else}
    <p style="color: var(--text);">Checking your cart...</p>
{/if}

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
        padding-left: 1.5em;
    }

    .order-summary p {
        color: var(--text);
    }

    .order-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
        align-items: center;
        gap: 40px
    }
</style>
