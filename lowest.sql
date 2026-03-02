--esta consulta genera un reporte de ventas por debajo del promedio.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS seller,
    FLOOR(AVG(s.quantity * p.price)) AS average_income
FROM employees e
JOIN sales s ON e.employee_id = s.sales_person_id
JOIN products p ON s.product_id = p.product_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING AVG(s.quantity * p.price) < (
    SELECT AVG(s2.quantity * p2.price)
    FROM sales s2
    JOIN products p2 ON s2.product_id = p2.product_id
)
ORDER BY average_income ASC;