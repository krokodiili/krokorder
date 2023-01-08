import type { Context } from '$lib/trpc/context';
import { initTRPC } from '@trpc/server';
import delay from 'delay';

export const t = initTRPC.context<Context>().create();

export interface User {
	name: string;
	email: string;
}

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
	})
});

export type Router = typeof router;
