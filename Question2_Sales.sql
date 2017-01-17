USE [Question2_Sales]

SELECT ProductId, COUNT(DateCreated) count
FROM (
	    (SELECT CustomerId, MIN(DateCreated) DateOfFirstBuy
		 FROM Sales
		 GROUP BY CustomerId) AS CUSTOMER_WITH_FIRST_BUY_DATE 
								 JOIN Sales 
								 ON ((Sales.CustomerId = CUSTOMER_WITH_FIRST_BUY_DATE.CustomerId)
									 and (Sales.DateCreated = CUSTOMER_WITH_FIRST_BUY_DATE.DateOfFirstBuy))
	 )
GROUP BY ProductId