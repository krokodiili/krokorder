import type { Context } from '$lib/trpc/context';
import { initTRPC } from '@trpc/server';
import { faker } from '@faker-js/faker';
import delay from 'delay';
import type { MenuItem, User } from 'src/types';
import * as yup from 'yup';

export const t = initTRPC.context<Context>().create();

const arrWithX = (xFN: () => any, size: number) =>
	new Array(size).fill('').map(() => {
		return xFN();
	});

function generateMockMenuItems(numItems: number): MenuItem[] {
	const mockMenuItems: MenuItem[] = [];
	for (let i = 0; i < numItems; i++) {
		mockMenuItems.push({
			name: faker.commerce.productName(),
			description: faker.lorem.sentence(),
			price: parseInt(faker.commerce.price()),
			image: faker.image.imageUrl(300, 300, 'food'),
			isAvailable: faker.datatype.boolean(),
			category: faker.commerce.department(),
			tags: arrWithX(faker.word.adjective, parseInt(faker.random.numeric()))
		});
	}
	return mockMenuItems;
}

const items = generateMockMenuItems(20);

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
			console.log(input, 'jooheheehe');
			return items;
		})
});

export type Router = typeof router;
