export type BagelData = {
    id: number,
    name: string,
    img: string,
    price: number,
};

type CartItem = BagelData & {
    quantity: number;
};

const KEY = 'bagl-cart';

export const cart = $state({
    items: [] as CartItem[]
});

function isCartItem(value: unknown): value is CartItem {
    if (typeof value !== 'object' || value === null) return false;

    const item = value as Record<string, unknown>;

    return (
        typeof item.id === 'number' &&
        Number.isFinite(item.id) &&
        typeof item.name === 'string' &&
        typeof item.img === 'string' &&
        typeof item.price === 'number' &&
        Number.isFinite(item.price) &&
        item.price >= 0 &&
        typeof item.quantity === 'number' &&
        Number.isInteger(item.quantity) &&
        item.quantity > 0
    );
}

export function loadCart() {
    try {
        const saved = localStorage.getItem(KEY);
        if (!saved) return;

        const items: unknown = JSON.parse(saved);

        if (Array.isArray(items) && items.every(isCartItem)) {
            cart.items = items;
        }
    } catch (error) {
        console.warn('Could not load the saved cart: ', error);
    }
}

function saveCart() {
    try {
        localStorage.setItem(
            KEY,
            JSON.stringify($state.snapshot(cart.items))
        );
    } catch (error) {
        console.warn('Could not save the cart: ', error);
    }
}

export function buyBagel(bagel: BagelData) {
    const exists = cart.items.find(item => item.id === bagel.id);

    if (exists) {
        exists.quantity++;
    } else {
        cart.items.push({
            ...bagel,
            quantity: 1
        });
    }

    saveCart();
}

export function removeItem(id: number) {
    cart.items = cart.items.filter((item) => item.id !== id);

    saveCart();
}

export function clearCart() {
    cart.items = [];
    saveCart();
}

export function countItems() {
    let sum = 0;
    for (let i = 0; i < cart.items.length; i++) {
      sum += cart.items[i].quantity;
    }
    return sum;
}

export function getPrice() {
  let sum = 0;

  for (let i = 0; i < cart.items.length; i++) {
    sum += cart.items[i].quantity * cart.items[i].price;
  }
  return sum;
}
