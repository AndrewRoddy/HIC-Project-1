export type BagelData = {
    id: number,
    name: string,
    img: string,
    price: number,
};

type CartItem = BagelData & {
    quantity: number;
};

export const cart = $state({
    items: [] as CartItem[]
});

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
}

export function removeItem(id: number) {
    cart.items = cart.items.filter((item) => item.id !== id);
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
