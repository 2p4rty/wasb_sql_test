WITH CTE_uniform_pay_amt as (
    SELECT
    SUPPLIER_ID, 
    min(invoice_amount) as max_pay_amt 
    FROM INVOICE
    group by supplier_id
), CTE_INVOICEUPD AS (
    SELECT 
    upa.SUPPLIER_ID
    ,inv.due_date
    ,inv.Invoice_amount
    ,ceiling(invoice_amount/max_pay_amt) as nr_pay 
    FROM CTE_uniform_pay_amt upa,Invoice inv where upa.supplier_id = inv.SUPPLIER_id
), CTE_pay_pre_plan as (
 SELECT 
    CTE_INVOICEUPD.SUPPLIER_ID,
    payment_Date,
    balance_outstanding,
    RANK() OVER (ORDER by payment_date) as rank
    FROM CTE_INVOICEUPD
    CROSS JOIN UNNEST(sequence(date_add('month',CAST((-1)*(nr_pay-1) as tinyint) ,last_day_of_month(due_Date)), last_day_of_month(due_date),INTERVAL '1' MONTH) ) as t(payment_date)
    JOIN (
        SELECT
        SUPPLIER_ID,
        sUM(invoice_amount) as balance_outstanding
        FROM  CTE_INVOICEUPD
        GROUP BY SUPPLIER_ID
    ) bo on CTE_INVOICEUPD.SUPPLIER_ID = bo.SUPPLIER_ID
    WHERE due_date > date_add('month',-1,current_date) 
) 
SELECT 
s.SUPPLIER_ID,
s.name as SUPPLIER_NAME,
CASE WHEN ppp.balance_outstanding < rank*max_pay_amt THEN ppp.balance_outstanding - (rank-1)*max_pay_amt ELSE upa.max_pay_amt END as payment_amount,
CASE WHEN ppp.balance_outstanding < rank*max_pay_amt THEN 0 ELSE ppp.balance_outstanding - rank*max_pay_amt END as balancE_outstanding,
payment_Date
FROM SUPPLIER s
JOIN CTE_pay_pre_plan ppp on ppp.supplier_id = s.supplier_id
JOIN CTE_uniform_pay_amt  upa on ppp.supplier_id = upa.supplier_id
