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
