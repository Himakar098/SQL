SELECT
    od.orderNumber,
    p.productLine,
    COUNT(*) AS line_item_count,
    ROUND(SUM(od.priceEach * od.quantityOrdered), 2) AS total_cost
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY od.orderNumber, p.productLine
ORDER BY od.orderNumber, p.productLine;
