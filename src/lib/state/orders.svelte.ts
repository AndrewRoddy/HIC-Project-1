import type { BagelData } from "./cart.svelte";
import { SvelteDate } from "svelte/reactivity";
import { discountFor } from "./rewards.svelte";

type OrderItem = BagelData & {
    quantity: number;
};

export type Order = {
    id: string;
    createdAt: string;
    items: OrderItem[];
    total: number; // what was actually paid, after any free bagels
    itemCount: number;
    freeBagels?: number;
    discount?: number;
};

const KEY = 'bagl-orders';

export const orders = $state({
    items: [] as Order[]
});

export function loadOrders() {
    const saved = localStorage.getItem(KEY);

    if (!saved) {
        orders.items = [];
        return;
    }

    const parsed = JSON.parse(saved);

    if (!Array.isArray(parsed)) {
        throw new Error('Saved order history is invalid.');
    }

    orders.items = parsed as Order[];
}

export function saveOrder(items: OrderItem[], freeBagels = 0): Order {
    if (items.length === 0) {
        throw new Error('Cannot save an empty order.');
    }

    loadOrders();

    const subtotal = items.reduce(
        (sum, item) => sum + item.price * item.quantity,
        0
    );
    const discount = discountFor(items, freeBagels);

    const order: Order = {
        id: crypto.randomUUID(),
        createdAt: new SvelteDate().toISOString(),

        items: items.map((item) => ({...item})),

        total: subtotal - discount,

        itemCount: items.reduce(
            (sum, item) => sum + item.quantity,
            0
        ),

        freeBagels,
        discount
    };

    const updated = [order, ...orders.items];

    localStorage.setItem(KEY, JSON.stringify(updated));
    orders.items = updated;

    return order;
}