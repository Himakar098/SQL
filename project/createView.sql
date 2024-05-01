CREATE VIEW CustomerSummary AS
SELECT 
  rc.customerId, 
  p.modelName, 
  SUM(julianday(rc.dateBack) - julianday(rc.dateOut) + 1) as daysRented, 
  CASE 
    WHEN strftime('%m', rc.dateBack) >= '07' THEN 
      strftime('%Y', rc.dateBack) || '/' || substr(strftime('%Y', rc.dateBack) + 1, -2) 
    ELSE 
      (strftime('%Y', rc.dateBack) - 1) || '/' || substr(strftime('%Y', rc.dateBack), -2) 
  END as taxYear, 
  SUM(rc.rentalCost) as rentalCost 
FROM 
  rentalContract rc 
LEFT JOIN Phone p ON rc.IMEI = p.IMEI 
WHERE 
  rc.dateBack IS NOT NULL 
GROUP BY 
  rc.customerId, taxYear, p.modelName;
