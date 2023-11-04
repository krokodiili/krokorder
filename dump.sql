CREATE TABLE menu_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    is_available BOOLEAN NOT NULL,
    base_quantity INTEGER default 1,
    image VARCHAR(255)
);

ALTER TABLE menu_items ADD COLUMN ts tsvector
    GENERATED ALWAYS AS (to_tsvector('english', name || description)) STORED;

CREATE INDEX ts_idx ON menu_items USING GIN (ts);

-- Create a new table to store tags
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE menu_items_tags (
    menu_item_id INTEGER REFERENCES menu_items(id),
    tag_id INTEGER REFERENCES tags(id),
    PRIMARY KEY (menu_item_id, tag_id)
);

CREATE TABLE menu_items_categories (
    menu_item_id INTEGER REFERENCES menu_items(id),
    category_id INTEGER REFERENCES categories(id),
    PRIMARY KEY (menu_item_id, category_id)
);
INSERT INTO menu_items (name, description, price, is_available, image, base_quantity) VALUES 
('Luxurious Wooden Bike', 'Alias consequuntur labore accusantium ipsum sint perferendis sit ex.', 725, true, 'https://loremflickr.com/300/300/food', 1),
('Gorgeous Rubber Mouse', 'Deleniti rerum libero excepturi nisi.', 353, false, 'https://loremflickr.com/300/300/food', 5),
('Ergonomic Soft Chair', 'Eaque saepe blanditiis enim nobis aliquid magnam nam architecto.', 222, false, 'https://loremflickr.com/300/300/food', 5),
('Sleek Metal Gloves', 'Similique sequi sequi perspiciatis facilis numquam voluptatibus error architecto.', 578, false, 'https://loremflickr.com/300/300/food', 5),
('Luxurious Rubber Shoes', 'Praesentium provident deleniti.', 563, true, 'https://loremflickr.com/300/300/food', 5),
('Sleek Granite Shirt', 'Laudantium impedit voluptatum.', 304, true, 'https://loremflickr.com/300/300/food', 1),
('Modern Rubber Computer', 'Iste eveniet itaque impedit non dicta reiciendis.', 762, true, 'https://loremflickr.com/300/300/food', 5),
('Bespoke Steel Hat', 'Dolore distinctio corporis sunt architecto aut delectus pariatur nihil distinctio.', 416, false, 'https://loremflickr.com/300/300/food', 5),
('Licensed Metal Mouse', 'Rerum distinctio provident sapiente voluptates doloremque perferendis deserunt.', 413, false, 'https://loremflickr.com/300/300/food', 1),
('Generic Frozen Pizza', 'Quidem quibusdam labore facilis modi nisi.', 872, false, 'https://loremflickr.com/300/300/food', 5),
('Rustic Granite Salad', 'Blanditiis expedita esse recusandae beatae maxime nostrum cupiditate accusantium pariatur.', 129, false, 'https://loremflickr.com/300/300/food', 1),
('Incredible Plastic Salad', 'Aperiam voluptatibus sint.', 285, true, 'https://loremflickr.com/300/300/food', 1),
('Incredible Fresh Soap', 'Asperiores optio voluptatibus expedita in velit sunt.', 138, false, 'https://loremflickr.com/300/300/food', 1),
('Fantastic Soft Pants', 'Quod dolor impedit non nam fuga dolor.', 615, true, 'https://loremflickr.com/300/300/food', 5),
('Licensed Cotton Computer', 'Dicta repudiandae veniam rem reiciendis tenetur maxime deserunt.', 64, false, 'https://loremflickr.com/300/300/food', 5),
('Recycled Frozen Sausages', 'Delectus placeat aperiam quibusdam.', 287, false, 'https://loremflickr.com/300/300/food', 1),
('Modern Cotton Mouse', 'Et incidunt repellendus ipsa.', 862, false, 'https://loremflickr.com/300/300/food', 1),
('Intelligent Soft Pizza', 'Quis laborum excepturi iste doloremque cumque libero.', 386, true, 'https://loremflickr.com/300/300/food', 5),
('Intelligent Frozen Bike', 'Veritatis maxime dicta amet error animi praesentium consectetur deserunt omnis.', 619, true, 'https://loremflickr.com/300/300/food', 1),
('Rustic Cotton Bike', 'Dolorum error perspiciatis.', 41, true, 'https://loremflickr.com/300/300/food', 5);
INSERT INTO categories (name) VALUES ('Computers') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM categories WHERE name = 'Computers')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('steel') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'steel')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('forceful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'forceful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('harmonious') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'harmonious')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('orange') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'orange')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('impish') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'impish')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('measly') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'measly')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('narrow') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'narrow')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('flippant') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Wooden Bike'), (SELECT id FROM tags WHERE name = 'flippant')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Sports') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM categories WHERE name = 'Sports')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('tame') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'tame')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('icky') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'icky')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('pleased') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'pleased')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('acidic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'acidic')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('personal') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'personal')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('handsome') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'handsome')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('emotional') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'emotional')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('excitable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'excitable')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('affectionate') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'affectionate')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('writhing') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Gorgeous Rubber Mouse'), (SELECT id FROM tags WHERE name = 'writhing')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Tools') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM categories WHERE name = 'Tools')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Books') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM categories WHERE name = 'Books')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('mature') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM tags WHERE name = 'mature')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('bronze') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM tags WHERE name = 'bronze')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('angry') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM tags WHERE name = 'angry')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('faithful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM tags WHERE name = 'faithful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('uncomfortable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Ergonomic Soft Chair'), (SELECT id FROM tags WHERE name = 'uncomfortable')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Movies') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM categories WHERE name = 'Movies')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('upright') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'upright')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('grown') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'grown')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('damaged') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'damaged')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('bountiful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'bountiful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('even') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'even')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('beneficial') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Metal Gloves'), (SELECT id FROM tags WHERE name = 'beneficial')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Grocery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Rubber Shoes'), (SELECT id FROM categories WHERE name = 'Grocery')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Outdoors') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Rubber Shoes'), (SELECT id FROM categories WHERE name = 'Outdoors')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('separate') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Rubber Shoes'), (SELECT id FROM tags WHERE name = 'separate')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('elderly') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Rubber Shoes'), (SELECT id FROM tags WHERE name = 'elderly')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('outlandish') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Luxurious Rubber Shoes'), (SELECT id FROM tags WHERE name = 'outlandish')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Shoes') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM categories WHERE name = 'Shoes')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Jewelery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM categories WHERE name = 'Jewelery')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('grotesque') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'grotesque')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('naive') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'naive')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('rash') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'rash')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('blind') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'blind')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('multicolored') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'multicolored')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('bland') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Sleek Granite Shirt'), (SELECT id FROM tags WHERE name = 'bland')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Health') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM categories WHERE name = 'Health')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('hurtful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'hurtful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('possible') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'possible')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('rude') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'rude')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('normal') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'normal')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('flat') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'flat')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('colorful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Rubber Computer'), (SELECT id FROM tags WHERE name = 'colorful')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Grocery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM categories WHERE name = 'Grocery')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('acceptable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'acceptable')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('irresponsible') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'irresponsible')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('pointed') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'pointed')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('whimsical') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'whimsical')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('imperfect') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'imperfect')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('blushing') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'blushing')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('sparse') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'sparse')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('untimely') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'untimely')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('questionable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'questionable')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('incredible') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Bespoke Steel Hat'), (SELECT id FROM tags WHERE name = 'incredible')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Outdoors') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM categories WHERE name = 'Outdoors')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('knowledgeable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM tags WHERE name = 'knowledgeable')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('watchful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM tags WHERE name = 'watchful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('thorny') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM tags WHERE name = 'thorny')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('baggy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM tags WHERE name = 'baggy')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('courageous') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Metal Mouse'), (SELECT id FROM tags WHERE name = 'courageous')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Garden') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM categories WHERE name = 'Garden')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Grocery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM categories WHERE name = 'Grocery')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('evergreen') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'evergreen')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('united') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'united')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('sane') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'sane')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('sinful') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'sinful')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('burdensome') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'burdensome')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('secret') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'secret')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('french') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'french')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('unwilling') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Generic Frozen Pizza'), (SELECT id FROM tags WHERE name = 'unwilling')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Grocery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM categories WHERE name = 'Grocery')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Health') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM categories WHERE name = 'Health')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('periodic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'periodic')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('lined') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'lined')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('admirable') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'admirable')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('indolent') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'indolent')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('accomplished') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'accomplished')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('kindhearted') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Granite Salad'), (SELECT id FROM tags WHERE name = 'kindhearted')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Baby') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Plastic Salad'), (SELECT id FROM categories WHERE name = 'Baby')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('made-up') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Plastic Salad'), (SELECT id FROM tags WHERE name = 'made-up')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('quixotic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Plastic Salad'), (SELECT id FROM tags WHERE name = 'quixotic')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('active') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Plastic Salad'), (SELECT id FROM tags WHERE name = 'active')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Movies') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM categories WHERE name = 'Movies')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('numb') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM tags WHERE name = 'numb')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('idolized') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM tags WHERE name = 'idolized')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('corny') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM tags WHERE name = 'corny')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('jaunty') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM tags WHERE name = 'jaunty')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('basic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Incredible Fresh Soap'), (SELECT id FROM tags WHERE name = 'basic')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Jewelery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM categories WHERE name = 'Jewelery')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Beauty') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM categories WHERE name = 'Beauty')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('glaring') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'glaring')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('naughty') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'naughty')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('necessary') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'necessary')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('married') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'married')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('scientific') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'scientific')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('lanky') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Fantastic Soft Pants'), (SELECT id FROM tags WHERE name = 'lanky')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Music') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Cotton Computer'), (SELECT id FROM categories WHERE name = 'Music')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('large') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Licensed Cotton Computer'), (SELECT id FROM tags WHERE name = 'large')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Health') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM categories WHERE name = 'Health')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Music') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM categories WHERE name = 'Music')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('ordinary') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM tags WHERE name = 'ordinary')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('baggy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM tags WHERE name = 'baggy')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('similar') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM tags WHERE name = 'similar')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('worthwhile') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM tags WHERE name = 'worthwhile')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('unnatural') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Recycled Frozen Sausages'), (SELECT id FROM tags WHERE name = 'unnatural')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Electronics') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Cotton Mouse'), (SELECT id FROM categories WHERE name = 'Electronics')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Clothing') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Cotton Mouse'), (SELECT id FROM categories WHERE name = 'Clothing')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('offensive') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Cotton Mouse'), (SELECT id FROM tags WHERE name = 'offensive')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('sarcastic') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Cotton Mouse'), (SELECT id FROM tags WHERE name = 'sarcastic')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('only') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Modern Cotton Mouse'), (SELECT id FROM tags WHERE name = 'only')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Computers') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM categories WHERE name = 'Computers')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Shoes') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM categories WHERE name = 'Shoes')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('unusual') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'unusual')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('round') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'round')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('previous') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'previous')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('dismal') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'dismal')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('cooked') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'cooked')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('upright') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Soft Pizza'), (SELECT id FROM tags WHERE name = 'upright')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Sports') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM categories WHERE name = 'Sports')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Jewelery') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM categories WHERE name = 'Jewelery')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('dim') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM tags WHERE name = 'dim')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('outgoing') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM tags WHERE name = 'outgoing')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('granular') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM tags WHERE name = 'granular')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('hot') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM tags WHERE name = 'hot')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('vague') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Intelligent Frozen Bike'), (SELECT id FROM tags WHERE name = 'vague')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Computers') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM categories WHERE name = 'Computers')) ON CONFLICT DO NOTHING;
INSERT INTO categories (name) VALUES ('Shoes') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_categories (menu_item_id, category_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM categories WHERE name = 'Shoes')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('disgusting') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'disgusting')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('experienced') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'experienced')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('muted') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'muted')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('deficient') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'deficient')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('eminent') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'eminent')) ON CONFLICT DO NOTHING;
INSERT INTO tags (name) VALUES ('happy') ON CONFLICT DO NOTHING;
INSERT INTO menu_items_tags (menu_item_id, tag_id) VALUES ( (SELECT id FROM menu_items WHERE name = 'Rustic Cotton Bike'), (SELECT id FROM tags WHERE name = 'happy')) ON CONFLICT DO NOTHING;
