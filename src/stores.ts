import { trpc } from '$lib/trpc/client';
import { derived, get, writable } from 'svelte/store';
import type { MenuItem } from './types';

function createCart() {
	const { subscribe, set, update } = writable<{
		[id: number]: {
			item: MenuItem;
			quantity: number;
			pos: number;
		};
	}>({});

	return {
		subscribe,
		order: () => {
			const payload = cartToList(get(cart));
			console.log(payload, 'jeboi');
			trpc().order.query({ items: payload });
		},
		addToCart: (item: MenuItem, quantity?: number) => {
			update((currentCart) => {
				const quantityToAdd = quantity || item.baseQuantity;
				const posToAdd = Object.keys(currentCart).length;

				return {
					...currentCart,
					[item.id]: currentCart[item.id]
						? {
								item,
								quantity: currentCart[item.id].quantity + quantityToAdd,
								pos: posToAdd
						  }
						: { item, quantity: quantityToAdd, pos: posToAdd }
				};
			});
		},
		removeFromCart: (id: number) =>
			update((currentCart) => {
				const copy = { ...currentCart };
				delete copy[id];
				return copy;
			})
	};
}

export const cart = createCart();

export const cartList = derived(cart, ($cart) => cartToList($cart));

const cartToList = (cart) => Object.values(cart).sort((a, b) => (a.pos >= b.pos ? 1 : -1));
