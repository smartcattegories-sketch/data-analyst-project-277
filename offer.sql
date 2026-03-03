--esta consulta muestra los clientes que hicieron su primera compra dentro de la promocion.
WITH first_purchases AS (
    SELECT 
        c.customer_id,
        c.first_name || ' ' || c.last_name AS customer,
        s.sale_date,
        e.first_name || ' ' || e.last_name AS seller,
        p.price,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.sale_date ASC, s.sales_id ASC) as purchase_order
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN employees e ON s.sales_person_id = e.employee_id
    JOIN products p ON s.product_id = p.product_id
)
SELECT 
    customer, 
    sale_date, 
    seller
FROM first_purchases
WHERE purchase_order = 1 AND price = 0
ORDER BY customer_id;