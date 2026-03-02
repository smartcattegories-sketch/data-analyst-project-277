--esta consulta muestra el ingreso total por dia.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS seller,
    TO_CHAR(s.sale_date, 'Day') AS day_of_week,
    FLOOR(SUM(s.quantity * p.price)) AS income
FROM employees e
JOIN sales s ON e.employee_id = s.sales_person_id
JOIN products p ON s.product_id = p.product_id
GROUP BY e.employee_id, e.first_name, e.last_name, day_of_week, EXTRACT(DOW FROM s.sale_date)
ORDER BY 
    EXTRACT(DOW FROM s.sale_date), 
    seller;