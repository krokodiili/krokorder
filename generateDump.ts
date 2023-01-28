import * as fs from 'fs';
import type { MenuItem } from './src/types';
import { faker } from '@faker-js/faker';

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

function generateSQLDump(menuItems: MenuItem[]) {
	let sql =
		'INSERT INTO menu_items (name, description, price, is_available, category, image) VALUES \n';
	for (const item of menuItems) {
		sql += `('${item.name}', '${item.description}', ${item.price}, ${item.isAvailable}, '${item.category}', '${item.image}'),\n`;
	}
	sql = sql.slice(0, -2) + ';\n';
	for (const item of menuItems) {
		for (const tag of item.tags) {
			console.log(tag);
			sql += `INSERT INTO tags (name) VALUES ('${tag}') ON CONFLICT DO NOTHING;\n`;
			sql += `INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = '${item.name}'), (SELECT id FROM tags WHERE name = '${tag}'));\n`;
		}
	}
	fs.writeFileSync('mock_data.sql', sql);
	console.log('SQL dump file created.');
}

export default generateSQLDump(items);
