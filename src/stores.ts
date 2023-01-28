import { writable } from 'svelte/store';
import type { MenuItem } from './types';

function createCart() {
	const { subscribe, set, update } = writable<MenuItem[]>([]);

	return {
		subscribe,
		addToCart: (item: MenuItem) => update((currentCart) => [...currentCart, item]),
		removeFromIndex: (index: number) =>
			update((currentCart) => {
				const copy = [...currentCart];
				copy.splice(index, 1);
				return copy;
			})
	};
}

export const cart = createCart();
