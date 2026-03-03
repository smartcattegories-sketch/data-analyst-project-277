-- esta consulta nos muestra cuantos clientes hay por grupo de edad.
SELECT 
    CASE 
        WHEN age BETWEEN 16 AND 25 THEN '16–25'
        WHEN age BETWEEN 26 AND 40 THEN '26–40'
        WHEN age > 40 THEN '40+'
    END AS age_category,
    COUNT(*) AS age_count
FROM customers
GROUP BY age_category
ORDER BY MIN(age);