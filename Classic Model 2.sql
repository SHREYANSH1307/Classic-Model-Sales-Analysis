/* View showing customers sales and difference in value from their previous sale and also see if any new customers who make their first purchase are likely to spend more */
WITH main_cte AS
(
SELECT orderNumber, orderDate, customerNumber, SUM(Sales_value) as Sales_value
FROM 
(SELECT t1.orderNumber, orderDate, customerNumber, productCode, quantityOrdered*priceEach AS Sales_value
FROM orders t1
INNER JOIN orderdetails t2
ON t1.orderNumber = t2.orderNumber) main
GROUP BY orderNumber, orderDate, customerNumber
),
Sales_query AS
(
SELECT t1.*, customername, row_number() over (partition by customername order by orderdate) as purchase_number,
 lag(Sales_value) over (partition by customername order by orderdate) as prev_sales_value
FROM main_cte t1
INNER JOIN customers t2
ON t1.customerNumber = t2.customerNumber)
SELECT*, SALES_VALUE - prev_sales_value AS purchase_value_change
FROM Sales_query 
WHERE prev_sales_value IS  NOT NULL