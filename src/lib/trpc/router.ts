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

			const rawQuery = pg.raw<{ rows: MenuItem[] }>(
				`
  SELECT
      mi.*,
      ts_rank(mi.ts, plainto_tsquery('english', ?)) AS rank,
      (
          SELECT ARRAY_AGG(t.name)
          FROM menu_items_tags mit
          JOIN tags t ON t.id = mit.tag_id
          WHERE mit.menu_item_id = mi.id
          GROUP BY mit.menu_item_id
      ) AS tags,
      (
          SELECT ARRAY_AGG(c.name)
          FROM menu_items_categories mic
          JOIN categories c ON c.id = mic.category_id
          WHERE mic.menu_item_id = mi.id
          GROUP BY mic.menu_item_id
      ) AS categories
  FROM
      menu_items mi
  WHERE
      (? = '' OR mi.ts @@ plainto_tsquery('english', ?))
  GROUP BY
      mi.id
  ORDER BY
      rank DESC
`,
				[userInput, userInput, userInput]
			);

			const items = await rawQuery;
			return transformToCamelCase(items.rows);
		})
});

export type Router = typeof router;
