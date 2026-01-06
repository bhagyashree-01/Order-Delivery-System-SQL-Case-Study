-- Customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Mumbai', '2024-01-10'),
(2, 'Neha Verma', 'Delhi', '2024-01-15'),
(3, 'Rahul Singh', 'Bangalore', '2024-02-01'),
(4, 'Priya Iyer', 'Chennai', '2024-02-10');

-- Orders
INSERT INTO orders VALUES
(101, 1, '2024-03-01', 2500, 'Delivered'),
(102, 2, '2024-03-03', 1800, 'Delivered'),
(103, 3, '2024-03-05', 3200, 'Delivered'),
(104, 1, '2024-03-10', 1500, 'Cancelled'),
(105, 4, '2024-03-12', 2700, 'Delivered');

-- Order Items
INSERT INTO order_items VALUES
(1, 101, 'Mobile Cover', 2, 500),
(2, 101, 'USB Cable', 3, 300),
(3, 102, 'Headphones', 1, 1800),
(4, 103, 'Smart Watch', 1, 3200),
(5, 105, 'Bluetooth Speaker', 1, 2700);

-- Delivery Partners
INSERT INTO delivery_partners VALUES
(1, 'Ravi Kumar', 'Mumbai'),
(2, 'Suresh Patel', 'Delhi'),
(3, 'Ankit Das', 'Bangalore');

-- Delivery
INSERT INTO delivery VALUES
(1, 101, 1, '2024-03-02', '2024-03-04', 'Delivered'),
(2, 102, 2, '2024-03-04', '2024-03-06', 'Delivered'),
(3, 103, 3, '2024-03-06', '2024-03-09', 'Delivered'),
(4, 105, 1, '2024-03-13', '2024-03-14', 'Delivered');
