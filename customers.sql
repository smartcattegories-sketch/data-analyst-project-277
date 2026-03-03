-- esta consulta muestra cuantos clientes unicos hubo y los ingresos generados 
SELECT 
    TO_CHAR(s.sale_date, 'YYYY-MM') AS selling_month,
    COUNT(DISTINCT s.customer_id) AS total_customers,
    FLOOR(SUM(s.quantity * p.price)) AS income
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY 1
ORDER BY 1 ASC;