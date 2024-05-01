SELECT
    orderNumber,
    COUNT(productCode) AS line_item_count,
    ROUND(SUM(priceEach * quantityOrdered), 2) AS total_cost
FROM orderdetails
GROUP BY orderNumber
ORDER BY total_cost DESC;
