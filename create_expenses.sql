CREATE TABLE EXPENSE (
    employee_id TINYINT,
    unit_price DECIMAL(8,2),
    quantity TINYINT
);
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Alex Jacobson
Items: Drinks, lots of drinks
Unit Price: 6.50
Quantity: 14',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Alex Jacobson
Items: More Drinks
Unit Price: 11.00
Quantity: 20',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Alex Jacobson
Items: So Many Drinks!
Unit Price: 22.00
Quantity: 18',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Alex Jacobson
Items: I bought everyone in the bar a drink!
Unit Price: 13.00
Quantity: 75',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Andrea Ghibaudi
Items: Flights from Mexico back to New York
Unit Price: 300
Quantity: 1',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Darren Poynton
Items: Ubers to get us all home
Unit Price: 40.00
Quantity: 9',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO
INSERT INTO EXPENSE (employee_id,unit_price,quantity)
SELECT 
employee_id , unit_price , quantity 
from EMPLOYEE e
JOIN (SELECT 
expense['Employee'] as employee_name
,cast(expense['Unit Price'] as decimal(8,2)) as unit_price
,cast(expense['Quantity'] as tinyint) as quantity
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , SPLIT(rowss,':')[2] as value FROM  UNNEST(split('Employee: Umberto Torrielli
Items: I had too much fun and needed something to eat
Unit Price: 17.50
Quantity: 4',chr(10))) as t(rowss)
) b) ) c on e.first_name || ' ' || e.last_name = c.employee_name ;
GO