-- 1.Total sales by city
SELECT 
    c.city,
    SUM(o.order_amount) AS total_sales
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;

-- 2.Top Customers By Spending
SELECT 
    c.customer_name,
    SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- 3.Customers spending above average
SELECT customer_id, total_spent
FROM (
    SELECT customer_id, SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) t
WHERE total_spent >
      (SELECT AVG(total_spent)
       FROM (
           SELECT SUM(order_amount) AS total_spent
           FROM orders
           GROUP BY customer_id
       ) avg_tbl);

-- 4.Rank Customers By spending(using window function)
SELECT 
    c.customer_name,
    SUM(o.order_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.order_amount) DESC) AS spending_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 5.Delivery time per order
SELECT 
    order_id,
    delivered_date - shipped_date AS delivery_days
FROM delivery;
 
-- 6.Average Delivery time per partner(Using window function)
SELECT 
    dp.partner_name,
    AVG(d.delivered_date - d.shipped_date)
        OVER (PARTITION BY dp.partner_name) AS avg_delivery_days
FROM delivery d
JOIN delivery_partners dp
    ON d.partner_id = dp.partner_id;

-- 7.Delivery Partner Performance
SELECT 
    dp.partner_name,
    COUNT(d.delivery_id) AS total_deliveries
FROM delivery d
JOIN delivery_partners dp
    ON d.partner_id = dp.partner_id
GROUP BY dp.partner_name
ORDER BY total_deliveries DESC;

-- 8.Order Completion rate
SELECT 
    ROUND(
        COUNT(CASE WHEN order_status = 'Delivered' THEN 1 END) * 100.0
        / COUNT(*), 2
    ) AS delivery_success_rate
FROM orders;

-- 9.Revenue contribution by customer(%)
SELECT 
    c.customer_name,
    SUM(o.order_amount) AS total_spent,
    ROUND(
        SUM(o.order_amount) * 100.0 /
        SUM(SUM(o.order_amount)) OVER (), 2
    ) AS revenue_percentage
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


