/* Give a breakdown of sales, but also show their credit limit */
WITH Sales AS
(SELECT t1.ordernumber, t1.customerNumber, productCode, quantityOrdered, priceEach, priceEach * quantityOrdered AS Sales_Value, creditLimit
FROM orders t1
INNER JOIN orderdetails t2
ON t1.ordernumber =  t2.ordernumber
INNER JOIN customers t3
ON t1.customerNumber = T3.customerNumber
)
SELECT ordernumber, customernumber,
CASE WHEN  creditlimit <75000 THEN "a: Less than $75k"
WHEN creditlimit between 75000 AND 100000 THEN "b:$75k - $100k"
WHEN creditlimit between 100000 AND 150000 THEN "c:$100k - $150k"
WHEN creditlimit >150000 THEN "d: Over $150k"
ELSE "Other"
END AS creditlimit_group,
sum(Sales_Value) AS Sales_Value
FROM Sales
GROUP BY ordernumber, customernumber, creditlimit_group