-- 1-mashq
WITH ranked AS (
    SELECT 
        d.name AS department,
        e.name AS employee,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY e.salary DESC) AS rnk
    FROM employees e
    JOIN departments d ON e.department_id = d.id
)
SELECT department, employee, salary
FROM ranked
WHERE rnk <= 3
ORDER BY department, rnk;
-- 2-mashq
SELECT w1.id
FROM weather w1
JOIN weather w2 ON w1.recordDate = w2.recordDate + INTERVAL '1' DAY
JOIN weather w3 ON w1.recordDate = w3.recordDate + INTERVAL '2' DAY
WHERE w1.temperature > w2.temperature 
  AND w2.temperature > w3.temperature;
