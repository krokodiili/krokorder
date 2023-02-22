import { pg } from '$lib/db';
import type { Context } from '$lib/trpc/context';
import { initTRPC } from '@trpc/server';
import delay from 'delay';
import type { MenuItem, User } from 'src/types';
import * as yup from 'yup';

export const t = initTRPC.context<Context>().create();

export function transformToCamelCase(data: object): object {
	if (Array.isArray(data)) {
		return data.map((item) => transformToCamelCase(item));
	} else if (typeof data === 'object') {
		const camelCasedData: any = {};
		Object.keys(data).forEach((key) => {
			const camelCasedKey = key
				.split('_')
				.map((word, index) => (index === 0 ? word : word[0].toUpperCase() + word.slice(1)))
				.join('');
			camelCasedData[camelCasedKey] = transformToCamelCase(data[key]);
		});
		return camelCasedData;
	} else {
		return data;
	}
}

export const router = t.router({
	greeting: t.procedure.query(async () => {
		await delay(1000); // 👈 simulate an expensive operation
		return `Hello tRPC v10 @ ${new Date().toLocaleTimeString()}`;
	}),
	order: t.procedure
		.input(yup.object({ items: yup.array() }))
		.query(async ({ input: { items } }) => {
			console.log(items, 'jeah');
		}),
	users: t.procedure.query(async () => {
		const data: User[] = [
			{
				name: 'lauri meltsukka',
				email: 'laurim@asdf.com'
			}
		];
		return data;
	}),
	menu: t.procedure
		.input(
			yup.object({
				text: yup.string()
			})
		)
		.query(async ({ input }) => {
			const userInput = input?.text || '';
			const items: MenuItem[] = await pg
				.select(
					'menu_items.*',
					pg.raw(`ts_rank(ts, plainto_tsquery('english', ?)) as rank`, [userInput]),
					pg.raw('ARRAY_AGG (tags.name) tags')
				)
				.from('menu_items')
				.innerJoin('menu_items_tags', 'menu_items.id', 'menu_items_tags.menu_item_id')
				.innerJoin('tags', 'tags.id', 'menu_items_tags.tag_id')

				.modify((qb) => {
					if (input?.text) {
						qb.whereRaw(`menu_items.ts @@ plainto_tsquery('english', ?)`, [userInput]);
					}
				})
				.groupBy('menu_items.id')
				.orderBy('rank', 'desc');

			return transformToCamelCase(items);
		})
});

export type Router = typeof router;
