<script lang="ts">
	import Bagel from "$lib/components/Bagel.svelte";
    import {cost} from '$lib/state/cost.svelte.js';
    let items = $state([
        {
            id: 1,
            name: "Ancient Grain Bagel",
            img: "Ancient-Grain-Bagel.webp",
            price: 9.5,
            quantity: 1
        },
        {
            id: 2,
            name: "Plain Bagel",
            img: "Plain-Bagel.webp",
            price: 9.5,
            quantity: 3
        }
    ]);

    function removeItem(id: number) {
        items = items.filter(item => item.id !==id);
    }

    function countItems() {
        let sum = 0;
        for (let i: number = 0; i < items.length; i++) {
            sum += items[i].quantity;
        }
        return sum;
    }
</script>

<h1 class="center" id="cart-title">My Cart</h1>

<div class="cart">
    <section class="cart-items" aria-labelledby="cart-title">
        
        <ul class="cart-list">
            {#each items as item (item.id)}
                <li class="cart-item">
                    <Bagel
                        img={item.img}
                        name={item.name}
                        price={item.price}
                    />

                    <div class="controls">
                        <div class="quantity">
                            <button 
                                type="button"
                                disabled={item.quantity <= 1}
                                onclick={() => item.quantity--}
                            >-</button>

                            <span>{item.quantity}</span>

                            <button
                                type="button"
                                onclick={() => item.quantity++}
                            >+</button>
                        </div>

                        <button
                            class="delete-button"
                            type="button"
                            onclick={() => removeItem(item.id)}
                        >
                            Delete
                        </button>
                    </div>
                </li>
            {:else}
                <li style="color: var(--info);">Your cart is empty.</li>
            {/each}
        </ul>
    </section>

    <aside class="cart-summary" aria-labelledby="summary-title">
        <h2 id="summary-title">Order Summary</h2>
            <p>Item Quantity: 
                {countItems()}
            </p>
            <p>Subtotal: 
                ${cost.total.toFixed(2)}
            </p>
        <button class="checkout-button" type="button">Checkout</button>
    </aside>
</div>

<style>
    h1 {
        color: var(--text);
    }

    h2 {
        color: var(--text);
    }

    .center {
        text-align: center;
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
        align-items: center;
        gap: 40px;
    }

    .cart-summary {
        padding: 24px;
        background-color: var(--accent);
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
    }

    .checkout-button {
        width: 80px;
        height: 38px;
        border: none;
        border-radius: 1em;
        background-color: var(--text);
        cursor: pointer;
    }
</style>
