SELECT 
c.name AS customer_name, 
COALESCE(SUM(o.amount), 0) AS total_amount,
count(o.id) as order_count,
COALESCE(AVG(o.amount),0) as avg_order,
CASE
    WHEN COALESCE(SUM(o.amount), 0) >= 800 THEN 'High Value'
    WHEN COALESCE(SUM(o.amount), 0) >= 500 THEN 'Medium Value'
    ELSE 'Low Value'
END AS category
FROM customers c
LEFT JOIN orders o 
ON c.id = o.customer_id
GROUP BY c.id, c.name;