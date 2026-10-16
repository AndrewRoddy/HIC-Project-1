const KEY = 'bagl-rewards';


export const rewards = $state({
    name: '',
    points: 0
});

// Reads the saved name/points into the state. Call this in onMount.
export function loadRewards() {
    try {
        const saved = localStorage.getItem(KEY);
        if (!saved) return;

        const data: unknown = JSON.parse(saved);
        if (typeof data !== 'object' || data === null) return;

        const { name, points } = data as Record<string, unknown>;

        if (typeof name === 'string') {
            rewards.name = name;
        }

        if (typeof points === 'number' && Number.isInteger(points) && points >= 0) {
            rewards.points = points;
        }
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

// 1 point per bagel. Points are lifetime and never reset.
export function addPoints(amount: number) {
    console.log('addPoints called with', amount);
    if (!Number.isInteger(amount) || amount <= 0) return;

    loadRewards(); // the checkout page starts with fresh state, so load first
    rewards.points += amount;
    saveRewards();
}