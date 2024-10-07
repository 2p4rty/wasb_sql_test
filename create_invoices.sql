CREATE TABLE INVOICE
(
    SUPPLIER_ID TINYINT,
    invoice_amount DECIMAL(8,2),
    due_date DATE
);

CREATE TABLE SUPPLIER
(
    SUPPLIER_ID TINYINT,
    name varchar 
);


CREATE TABLE STG_INV_SUP
(
    name varchar,
    invoice_amount DECIMAL(8,2),
    due_date date
);


INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Party Animals
Invoice Items: Zebra, Lion, Giraffe, Hippo
Invoice Amount: 6000
Due Date: 3 months from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;

INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Catering Plus
Invoice Items: Champagne, Whiskey, Vodka, Gin, Rum, Beer, Wine.
Invoice Amount: 2000
Due Date: 2 months from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;

INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Catering Plus
Invoice Items: Pizzas, Burgers, Hotdogs, Cauliflour Wings, Caviar
Invoice Amount: 1500
Due Date: 3 months from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;

INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Dave''s Discos
Invoice Items: Dave, Dave Equipment
Invoice Amount: 500
Due Date: 1 month from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;

INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Entertainment tonight
Invoice Items: Portable Lazer tag, go carts, virtual darts, virtual shooting, puppies.
Invoice Amount: 6000
Due Date: 3 months from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;

INSERT INTO STG_INV_SUP
SELECT 
expense['Company Name'] as name
,cast(expense['Invoice Amount'] as decimal(8,2)) as invoice_amount
,last_day_of_month(date_add('month',cast(regexp_extract(expense['Due Date'], '\d+') as tinyint) , current_date)) as due_date
FROM (SELECT map_agg(trim(kname),trim(value)) expense FROM (
SELECT SPLIT(rowss,':')[1] as kname , CASE WHEN cardinality(SPLIT(rowss,':')) > 1 then SPLIT(rowss,':')[2] else NULL END as value FROM  UNNEST(split('Invoice
-------
Company Name: Ice Ice Baby
Invoice Items: Ice Luge, Lifesize ice sculpture of Umberto
Invoice Amount: 4000
Due Date: 6 months from now',chr(10))) as t(rowss)
) b WHERE value is not null ) d ;



-- Populate Supplier
INSERT INTO SUPPLIER
SELECT DISTINCT 
RANK() OVER (ORDER BY NAME) as supplier_id,
name
FROM STG_INV_SUP ;

--Populate Invoice
INSERT INTO INVOICE 
SELECT supplier_id, invoice_amount, due_date from STG_INV_SUP i , SUPPLIER s where i.name = s.name;

-- DROP STG
DROP TABLE STG_INV_SUP;