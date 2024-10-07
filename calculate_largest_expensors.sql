
WITH CTE_EXPENSE AS (
    SELECT
    employee_id,
    SUM(unit_price * quantity) as total_expensed_amount
    FROM EXPENSE 
    GROUP BY Employee_id
    HAVING SUM(quantity) >1000 
)
SELECT 
e.employee_id,
e.first_name || ' ' || e.last_name as employee_name ,
e.manager_id ,
m.first_name || ' ' || m.last_name as manager_name ,
total_expensed_amount
FROM Employee e 
join Employee m on e.manager_id = m.employee_id
JOIN CTE_EXPENSE exp on e.employee_id = exp.employee_id   
order by total_expensed_amount desc;