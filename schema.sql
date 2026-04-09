CREATE TABLE customers (
    id INTEGER,
    name TEXT
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    amount INTEGER
);