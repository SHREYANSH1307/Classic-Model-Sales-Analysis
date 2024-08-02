USE classicmodels;
SELECT orderdate, t1.ordernumber, quantityOrdered, priceeach, productname, productline, buyPrice, city , country
FROM ORDERS t1
INNER JOIN orderdetails t2
ON t1.ordernumber = t2.ordernumber
INNER JOIN products t3
ON t2.productcode = t3.productcode
INNER JOIN customers t4
ON t1.customernumber = t4.customernumber
WHERE year(orderdate) = 2004