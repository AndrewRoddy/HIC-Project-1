const KEY = 'cost';
const isBrowser = typeof localStorage !== 'undefined';

// Initial load of the local storage value
function load() {
	if (!isBrowser) return { total: 0 };
	try {
		const saved = localStorage.getItem(KEY);
		if (saved) {
			return { total: 0, ...JSON.parse(saved) };
		}
		return { total: 0 };
	} catch {
		return { total: 0 };
	}
}

// Sets the value of the cost state for Svelte
export const cost = $state(load());

// Modifies as the app runs
if (isBrowser) {
	$effect.root(() => {
		$effect(() => {
			// JSON.stringify reads every property, so any change re-runs this
			localStorage.setItem(KEY, JSON.stringify(cost));
		});
	});
}
