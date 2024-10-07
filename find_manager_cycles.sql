

WITH RECURSIVE emploop(employee_id,parents,level) AS 
(
    SELECT  employee_id,ARRAY[manager_id] as parents,1 as level  FROM EMPLOYEE 
    UNION ALL 
    SELECT el.employee_id, el.parents || e.manager_id as parents, el.level+1 as level FROM EMPLOYEE as e , emploop as el where e.employee_id = el.parents[cardinality(el.parents)] and array_position(el.parents,e.manager_id) = 0
)
SELECT 
Employee_id, 
Employeeloop
FROM (SELECT 
EMPLOYEE_ID , array_remove(parents,employee_id) as Employeeloop , RANK() OVER (PARTITION BY employee_id ORDER BY level desc) as rank
FROM (SELECT * from emploop limit 100) t ) t1
WHERE t1.rank = 1 
order by Employee_id;

