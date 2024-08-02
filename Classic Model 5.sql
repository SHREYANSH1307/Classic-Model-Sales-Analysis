	/* Breakdown of What products are commonly purchased together, and rarely purchased together */
    WITH product_sales AS
    (
    SELECT orderNumber, t1.productCode,productline
    FROM orderdetails t1
    INNER JOIN products t2
    ON t1.productCode = t2.productCode
    )
    SELECT DISTINCT t1.orderNumber, t1.productline AS product_one, t2.productline AS product_two
    FROM product_sales t1
    LEFT JOIN product_sales t2
    ON t1.orderNumber = t2.orderNumber and t1.productline <> t2.productline
    
    
    