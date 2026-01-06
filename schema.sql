-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount NUMERIC(10,2),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price NUMERIC(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Delivery partners table
CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    city VARCHAR(50)
);

-- Delivery table
CREATE TABLE delivery (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    partner_id INT,
    shipped_date DATE,
    delivered_date DATE,
    delivery_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (partner_id) REFERENCES delivery_partners(partner_id)
);
