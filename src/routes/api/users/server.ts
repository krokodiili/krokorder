import { json } from '@sveltejs/kit';

export interface User {
	name: string;
	email: string;
}

export const GET = async () => {
	const data: User[] = [
		{
			name: 'lauri',
			email: 'laurim@asdf.com'
		}
	];

	return json(data);
};
