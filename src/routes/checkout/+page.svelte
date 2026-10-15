<script lang="ts">
    import {
        cart, 
        countItems,
        clearCart,
		    loadCart
    } from '$lib/state/cart.svelte';
    import { onMount } from 'svelte';
    import { goto } from '$app/navigation';
    import { resolve } from '$app/paths';
    import { saveOrder } from '$lib/state/orders.svelte';

    let purchasedItems = $state<typeof cart.items>([]);
    let itemCount = $state(0);
    let total = $state(0);
    let ready = $state(false);
    let checkoutError = $state('');

    onMount(() => {
        try {
            loadCart();

            if (countItems() === 0) {
                // eslint-disable-next-line svelte/no-navigation-without-resolve
                void goto(`${resolve('/cart')}?reason=empty-cart`, {
                    replaceState: true
                });
                return;
            }

            const order = saveOrder(cart.items);

            purchasedItems = order.items;
            itemCount = order.itemCount;
            total = order.total;

            clearCart();
            ready = true;
        } catch (error) {
            console.error('Checkout failed: ', error);
            checkoutError = "We coudn't finish saving your order. \
            Please go back to your cart and try again.";
        }
    });
</script>

{#if checkoutError}
    <p role="alert">{checkoutError}</p>
    <a href="{resolve('/cart')}">Return to Cart</a>
{:else if ready}
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
    <a class="history-link" href="{resolve('/orders')}">View order history</a>
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

    .history-link {
        color: var(--accent);
        text-decoration: underline;
        text-decoration-style: 0.15em;
        padding-left: 1.5em;
    }

    .history-link:hover {
        color: var(--accent-hover);
    }
</style>
