import { pg } from '$lib/db';
import type { Context } from '$lib/trpc/context';
import { initTRPC } from '@trpc/server';
import delay from 'delay';
import type { User } from 'src/types';
import * as yup from 'yup';

export const t = initTRPC.context<Context>().create();

export const router = t.router({
	greeting: t.procedure.query(async () => {
		await delay(1000); // 👈 simulate an expensive operation
		return `Hello tRPC v10 @ ${new Date().toLocaleTimeString()}`;
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
			const items = await pg
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
						console.log('jeah', input.text);
					}
				})
				.groupBy('menu_items.id')
				.orderBy('rank', 'desc');

			console.log(items);

			return items;
		})
});

export type Router = typeof router;
