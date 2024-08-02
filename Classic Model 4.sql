/* Since it is discovered that shipping id delayed due to bad weather and it's possible they will take up more than 3 days to arrive , Find the list of affected orders. */
SELECT *,
date_add(shippeddate, interval 3 day) AS latest_arrival,
case when date_add(shippeddate, interval 3 day) > requiredDate then 1 else 0 end as late_flag
 FROM orders
 WHERE
 (case when date_add(shippeddate, interval 3 day) > requiredDate then  1 else 0 end)=1