import * as fs from 'fs';
import type { CreateMenuItem } from './src/types';
import { faker } from '@faker-js/faker';

const arrWithX = (xFN: () => any, size: number) =>
	new Array(size).fill('').map(() => {
		return xFN();
	});

function generateMockMenuItems(numItems: number): CreateMenuItem[] {
	const mockMenuItems: CreateMenuItem[] = [];
	for (let i = 0; i < numItems; i++) {
		mockMenuItems.push({
			name: faker.commerce.productName(),
			description: faker.lorem.sentence(),
			price: parseInt(faker.commerce.price()),
			image: faker.image.imageUrl(300, 300, 'food'),
			isAvailable: faker.datatype.boolean(),
			categories: arrWithX(
				faker.commerce.department,
				faker.datatype.number({
					min: 1,
					max: 2
				})
			),
			tags: arrWithX(
				faker.word.adjective,
				faker.datatype.number({
					min: 1,
					max: 10
				})
			),
			baseQuantity: faker.helpers.arrayElement<number>([1, 5])
		});
	}
	return mockMenuItems;
}

const items = generateMockMenuItems(20);

function generateSQLDump(menuItems: CreateMenuItem[]) {
	console.log(menuItems);
	let sql =
		'INSERT INTO menu_items (name, description, price, is_available, image, base_quantity) VALUES \n';
	for (const item of menuItems) {
		sql += `('${item.name}', '${item.description}', ${item.price}, ${item.isAvailable}, '${item.image}', ${item.baseQuantity}),\n`;
	}
	sql = sql.slice(0, -2) + ';\n';
	for (const item of menuItems) {
		for (const category of item.categories) {
			console.log(item.categories);
			sql += `INSERT INTO categories (name) VALUES ('${category}') ON CONFLICT DO NOTHING;\n`;
			sql += `INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = '${item.name}'), (SELECT id FROM categories WHERE name = '${category}')) ON CONFLICT DO NOTHING;\n`;
		}
		for (const tag of item.tags) {
			sql += `INSERT INTO tags (name) VALUES ('${tag}') ON CONFLICT DO NOTHING;\n`;
			sql += `INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = '${item.name}'), (SELECT id FROM tags WHERE name = '${tag}')) ON CONFLICT DO NOTHING;\n`;
		}
	}
	fs.writeFileSync('mock_data.sql', sql);
	console.log('SQL dump file created.');
}

export default generateSQLDump(items);
