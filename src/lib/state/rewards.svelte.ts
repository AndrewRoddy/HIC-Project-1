const KEY = 'bagl-rewards';

// One shared tier list.
export const tiers = [
    { bagels: 2, free: 1, layout: 'stack', flavor: 'Plain' },
    { bagels: 4, free: 2, layout: 'stack', flavor: 'Garlic' },
    { bagels: 8, free: 3, layout: 'stack', flavor: 'Cranberry' },
    { bagels: 16, free: 4, layout: 'stack', flavor: 'Everything' },
    { bagels: 32, free: 5, layout: 'stack', flavor: 'Honey-Wholewheat' }
];

export const rewards = $state({
    name: '',
    points: 0,
    freeUsed: 0 // free bagels already redeemed
});

function isCount(value: unknown): value is number {
    return typeof value === 'number' && Number.isInteger(value) && value >= 0;
}

// Reads the saved name/points/freeUsed into the state. Call this in onMount.
export function loadRewards() {
    try {
        const saved = localStorage.getItem(KEY);
        if (!saved) return;

        const data: unknown = JSON.parse(saved);
        if (typeof data !== 'object' || data === null) return;

        const { name, points, freeUsed } = data as Record<string, unknown>;

        if (typeof name === 'string') rewards.name = name;
        if (isCount(points)) rewards.points = points;
        if (isCount(freeUsed)) rewards.freeUsed = freeUsed;
    } catch (error) {
        console.warn('Could not load the saved rewards: ', error);
    }
}

function saveRewards() {
    try {
        localStorage.setItem(KEY, JSON.stringify($state.snapshot(rewards)));
    } catch (error) {
        console.warn('Could not save the rewards: ', error);
    }
}

export function setName(name: string) {
    loadRewards(); // make sure we don't overwrite saved points with the default 0
    rewards.name = name;
    saveRewards();
}

// 1 point per PAID bagel. Points are lifetime and never reset.
export function addPoints(amount: number) {
    if (!Number.isInteger(amount) || amount <= 0) return;

    loadRewards(); // the checkout page starts with fresh state, so load first
    rewards.points += amount;
    saveRewards();
}

// Total free bagels earned so far (the highest tier reached).
export function freeEarned() {
    let free = 0;
    for (const tier of tiers) {
        if (rewards.points >= tier.bagels) free = tier.free;
    }
    return free;
}

// Free bagels the user can still redeem.
export function freeAvailable() {
    return Math.max(0, freeEarned() - rewards.freeUsed);
}

// Record that some free bagels were redeemed.
export function spendFree(amount: number) {
    if (!Number.isInteger(amount) || amount <= 0) return;

    loadRewards();
    rewards.freeUsed += amount;
    saveRewards();
}

// Dollar value of the free bagels. All bagels cost the same today, but this
// uses the cheapest one in the order so it stays fair if prices ever differ.
export function discountFor(items: { price: number }[], free: number) {
    if (items.length === 0 || free <= 0) return 0;

    const cheapest = Math.min(...items.map((item) => item.price));
    return Math.round(free * cheapest * 100) / 100;
}