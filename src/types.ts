export interface User {
	name: string;
	email: string;
}

export interface MenuItem {
	id: number;
	name: string;
	description: string;
	price: number;
	image?: string;
	isAvailable: boolean;
	category: string;
	tags: string[];
}
