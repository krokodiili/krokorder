export interface User {
	name: string;
	email: string;
}

export type CreateMenuItem = Omit<MenuItem, 'id'>;

export interface MenuItem {
	id: number;
	name: string;
	description: string;
	price: number;
	image?: string;
	isAvailable: boolean;
	category: string;
	tags: string[];
	baseQuantity: number;
}
