/*****************************************************************************************************************
NAME:    EC_IT143_W3.4_dg
PURPOSE: Respond to AdventureWorks2019

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/26/2023  GUINHOUYA       1. Built this script to respond to questions in EC_IT143_W3.3


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/


-- # Q1 Marginal Question: What are the top performing geographical region in term of sales volume ? "Nixon Ehaji" 
-- 3 A1 Sales.territory and Sales.SalesOrderDetail, and ...Header, Sales.SalesPerson, Sales.Sales.PersonQuotaHistory



  Select SalesVolumes,F.TerritoryID, Sales.SalesTerritory.Name, Sales.SalesTerritory.CountryRegionCode
  From (Select Sales.SalesOrderHeader.TerritoryID, Count(Sales.SalesOrderHeader.SalesOrderID) AS SalesVolumes  --Subquery used to count the number of order or sales per geographical region 
       From  Sales.SalesOrderHeader 
       Group By TerritoryID)  AS F
	   Inner Join Sales.SalesTerritory 
    On f.TerritoryID=Sales.SalesTerritory.TerritoryID 
	Order by SalesVolumes DESC



-- # Q2 Marginal Question: Which shipping method has the lowest shipping rate ? "Sam Bingham"
-- # A2 Purchasing.ShipMethod



Select Top 1 *                                                   --Select the first row  
From Purchasing.ShipMethod                                       --From the Purchasing.ShipMethod 
Order by ShipRate                                                --While this table is ordred by ascending ShipRate




-- # Q3 Moderate Question: how many sales order have been placed by customer and what is the average order value of these customers ? "Nixon Ehaji " 
--# A3 Sales.SalesOrderHeader, Sales.Customer 



Select Count(S.SalesOrderID) As NumberSalesOrder --Count the number of Sales Order using the count function
From Sales.SalesOrderHeader AS S;

Select CustomerID, AVG(TotalDue) AS AveOrderV                                                          /*Calculate the Average Cost of Order using the Total due at each order*/
From Sales.SalesOrderHeader                                                                          /* Order total due are grouped by CustomerID using Group by clause*/
Group by CustomerID                                                                                /*Order by desceding CustomerOrderAverageValue*/
Order by AveOrderV DESC



-- # Q4 Moderate Question: Kindly provide a list of all the human resources departement shifts together with theirs start and end hour? "Richard Adu"
--# A4 HumanResources.EmployeeDepartmentHistory, HumanResources.Shift, HR.Employee



Select V.DepartmentID,V.BusinessEntityID, N.ShiftID, N.StartTime,  N.EndTime                      --Select table to display
From HumanResources.EmployeeDepartmentHistory AS V INNER JOIN HumanResources.Shift  AS N          --Use Alias to simplify table name
ON V.ShiftID=N.ShiftID                                                                   
Where DepartmentID=9                                                                              --Filter by departementID, HR departementID is equal to 9



-- # Q5 Increased Question: Our Marketing team wants to analyze the performance of our bicycle product in the past year. Can you provide a breakdown of total sales revenue by product category, including bicycles and related accessories ? "Nixon Ehaji"
-- # A5 Sales.OrderDetail, Production.Product, Production.ProductCategory, Descriotion, Subcategory



DROP TABLE IF EXISTS dbo.X;

Select SUM(Sales.SalesOrderDetail.LineTotal) AS TotalRevenus, ProductID into X                    --Create a temporary table with a column wich display the TotalRevenus gouped by productID
From Sales.SalesOrderDetail
Group by ProductID;

Select X.ProductID,TotalRevenus, P.ProductSubcategoryID, K.ProductCategoryID, P.Name AS ProductName, K.Name AS SubcategoryName, C.Name AS ProductCategoryName

From ((X inner Join Production.Product AS P                                                        --User Join statement to join every table need to display your information
   on X.ProductID=P.ProductID) Left Join Production.ProductSubcategory AS K
   ON P.ProductSubcategoryID=K.ProductSubcategoryID) Left Join Production.ProductCategory AS C 
   on K.ProductCategoryID=C.ProductCategoryID ; 



-- # Q6 Increase Question:  Increased complexity: I am planning to organize a donation course with the bikes, I purchased from your company recently. As a measure of precaution, I would like to have a technician with a good knowledge of your products to take care of the maintenance. Could you share a list of mechanic that match this criterion along with their contacts with me ?
-- # A6 Person.BusinessEntity, PersonBusinessEntityContact, Person.BusinessEntityAddress


Select J.BusinessEntityID, CONCAT(H.FirstName,' ', H.MiddleName,' ', H.LastName) AS CandidateName, PhoneNumber , JobTitle

From ((HumanResources.Employee AS J inner Join Person.Person AS H
on J.BusinessEntityID=H.BusinessEntityID) Left Join Person.PersonPhone AS F
on J.BusinessEntityID=F.BusinessEntityID )

Where J.JobTitle Like '%Technician%' or J.JobTitle Like '%Mechanician%' ;



-- # Q7 Metadata Question: Send me the last event that occured on our database along with the detail?
-- # A7


Select Top 1 *                                                                                    --Order the Databaselog from the most recent entry to the oldest one then select the 1 row 
From dbo.DatabaseLog
Order by PostTime DESC



-- # Q8 Metadata Question:Can you identify the Person.Person table's primary key and associated data type ? "Liah Macasaet"
-- # A8


SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_SCHEMA ='Person' AND TABLE_NAME = 'Person';      --The INFORMATION_SCHEMA_CONSTRAINTS organize information regarding each table constraint in an organized way
                                                                                                 -- Filter by CONSTRAINT_TYPE, TABLE_SCHEMA, TABLE_NAME
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Person' 



SELECT GETDATE() AS my_date;