DESCRIBE swiggy;

SELECT * FROM swiggy;

SELECT
SUM(Order_ID IS NULL) AS Missing_OrderID,
SUM(Customer_Name IS NULL) AS Missing_CustomerName,
SUM(Restaurant_Rating IS NULL) AS Missing_Rating
FROM swiggy;

SELECT DISTINCT City
FROM swiggy;

UPDATE swiggy
SET City = 'Bangalore'
WHERE City IN ('Bengaluru','bangalore');

UPDATE swiggy
SET City = 'Delhi'
WHERE City = 'delhi';

SELECT Order_ID, COUNT(*)
FROM swiggy
GROUP BY Order_ID
HAVING COUNT(*) > 1;

UPDATE swiggy
SET Restaurant_Rating =
(
 SELECT avg_rating
 FROM (
      SELECT ROUND(AVG(Restaurant_Rating),1) AS avg_rating
      FROM swiggy
 ) x
)
WHERE Restaurant_Rating IS NULL;

UPDATE swiggy
SET Customer_Name = 'Unknown'
WHERE Customer_Name = '';

SELECT DISTINCT Customer_Name
FROM swiggy;

SELECT
MIN(Order_Value),
MAX(Order_Value),
AVG(Order_Value)
FROM swiggy;

SELECT
MIN(Delivery_Time_Minutes),
MAX(Delivery_Time_Minutes)
FROM swiggy;

UPDATE swiggy
SET Payment_Method = 'Unknown'
WHERE Payment_Method = '';

SELECT *
FROM swiggy
WHERE Order_ID IN (
    SELECT Order_ID
    FROM (
        SELECT Order_ID
        FROM swiggy
        GROUP BY Order_ID
        HAVING COUNT(*) > 1
    ) x
)
LIMIT 30;

ALTER TABLE swiggy
ADD COLUMN Transaction_ID INT AUTO_INCREMENT PRIMARY KEY;

CREATE TABLE swiggy_backup AS
SELECT * FROM swiggy;