CREATE TRIGGER update_rentalCost 
AFTER UPDATE OF dateBack ON rentalContract 
FOR EACH ROW 
WHEN NEW.dateBack IS NOT NULL AND OLD.dateBack IS NULL 
BEGIN 
  UPDATE rentalContract 
  SET rentalCost = ( 
    SELECT
      baseCost + dailyCost * (julianday(NEW.dateBack) - julianday(OLD.dateOut) + 1) 
    FROM 
      PhoneModel 
    JOIN Phone ON NEW.IMEI = Phone.IMEI 
    WHERE 
      Phone.modelNumber = PhoneModel.modelNumber AND Phone.modelName = PhoneModel.modelName
  ) 
  WHERE customerId = NEW.customerId AND IMEI = NEW.IMEI; 
END;
