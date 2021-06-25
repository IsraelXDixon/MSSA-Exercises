--Name: Israel Dixon
--File: SQLEx6-dixon
--Date: Feb 17, 2021

--Part 1 & 2
Use ClassicCars
go

CREATE TABLE dbo.Offices
(
OfficeCode int PRIMARY KEY,
City varchar(50),
Phone varchar(50),
AddressLine1 varchar(50),
AddressLine2 varchar(50),
OfficeState varchar(50),
OfficeCountry varchar(50),
OfficePostalCode varchar(50),
OfficeTerritory varchar(50),

);

BULK INSERT dbo.Offices
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Offices.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
----------------------------------------------------------
CREATE TABLE dbo.Employees
(
EmployeeID varchar(50) PRIMARY KEY,
LastName varchar(50),
FirstName varchar(50),
Extension varchar(50),
Email varchar(50),
OfficeCode Int,
ReportsTo varchar(50),
JobTitle varchar(50),
FOREIGN KEY (OfficeCode) References Offices(OfficeCode)
);

BULK INSERT dbo.Employees
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Employees.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
-------------------------------------------------------------
CREATE TABLE dbo.customers
(
CustomerID int PRIMARY KEY,
CustomerName varchar(50),
ContactLastName varchar(50),
ContactFirstName varchar(50),
Phone varchar(50),
AddressLine1 varchar(50),
AddressLine2 varchar(50),
CustomerCity varchar(50),
CustomerState varchar(50),
CustomerPostalCode varchar(50),
CustomerCountry varchar(50),
SalesRepEmployeeNumber varchar(50),
CredLimit float,
FOREIGN KEY (SalesRepEmployeeNumber) REFERENCES Employees(EmployeeID)
);

BULK INSERT dbo.Customers
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Customers.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
--------------------------------------------------------------------

-------------------------------------------------------------------
CREATE TABLE dbo.Payments
(
CustomerNumber int,
CheckNumber varchar(50),
PaymentDate varchar(50),
Amount float,
FOREIGN KEY (CustomerNumber) REFERENCES Customers(CustomerID),
PRIMARY KEY (CustomerNumber, CheckNumber)
);

BULK INSERT dbo.Payments
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Payments.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
-----------------------------------------------------------------------
CREATE TABLE dbo.ProductLines
(
ProductLine varchar(1700) PRIMARY KEY,
TextDescription varchar(1700),
htmlDescription varchar(1700),
Image varchar(1700),
);

BULK INSERT dbo.ProductLines
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\ProductLines.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
--------------------------------------------------------------------------
CREATE TABLE dbo.Products
(
ProductCode varchar(1700) PRIMARY KEY,
ProductName varchar(1700),
ProductLine varchar(1700),
ProductScale varchar(1700),
ProductVendor varchar(1700),
ProductDescription varchar(1700),
QuantityInStock int,
BuyPrice float,
MSRP float,
FOREIGN KEY (ProductLine) REFERENCES ProductLines(ProductLine)
);

BULK INSERT dbo.Products
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Products.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
------------------------------------------------------------------
CREATE TABLE dbo.OrderDetails
(
OrderNumber int,
ProductCode varchar(1700),
QuantityOrdered int,
PriceEach float,
OrderLineNumber varchar(50),
PRIMARY KEY (OrderNumber, ProductCode),
FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
);

BULK INSERT dbo.OrderDetails
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\OrderDetails.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
-------------------------------------------------------------
drop table if exists dbo.Orders
--------------------------------------------------------------
CREATE TABLE dbo.Orders
(
OrderNumber int PRIMARY KEY,
OrderDate varchar(50),
RequiredDate varchar(50),
ShippedDate varchar(50),
OrderStatus varchar(50),
Comments varchar(200),
CustomerNumber int,
FOREIGN KEY (CustomerNumber) REFERENCES Customers(CustomerID),

);

BULK INSERT dbo.Orders
from 'C:\Users\supre\MSSA2021\ISTA420\ClassicCars\Orders.txt'
with
(
format = 'csv',
fieldquote = '"',
datafiletype = 'char',
fieldterminator = ',',
rowterminator = '\n'
)
----------------------------------------------------------------------
--To check for Foriegn Keys
IF EXISTS
    (SELECT * FROM INFORMATION_SCHEMA.TABLES
     WHERE TABLE_SCHEMA = 'dbo' AND
        TABLE_NAME = 'Customers')
BEGIN
    ALTER TABLE dbo.Customers
    DROP CONSTRAINT IF EXISTS FK_Customers_Employees;
END
-------------------------------------------------------------------------
use ClassicCars
go
--Part 3

--(a) How many distinct products does ClassicModels sell?
select distinct ProductName, QuantityInStock from Products 
where ProductLine like 'Classic Cars';

--(b) Report the name and city of customers who don't have sales representatives?
select CustomerName, CustomerCity, SalesRepEmployeeNumber from customers 
where SalesRepEmployeeNumber like 'NULL';

--(c) What are the names of executives with VP or Manager in their title? Use the CONCAT function
--to combine the employee's rst name and last name into a single eld for reporting.
select e.JobTitle, CONCAT(e.FirstName, e.LastName) as EmployeeName
from Employees e
where JobTitle like '%Manager%' or JobTitle like '%VP%';

--(d) Which orders have a value greater than $5,000?
select OrderNumber, sum (QuantityOrdered * PriceEach) as OrderValue, OrderDetails.OrderLineNumber
from Orderdetails
group by OrderNumber, OrderDetails.OrderLineNumber
having sum(QuantityOrdered * PriceEach) > 5000;

--(e) Report the account representative for each customer.
select CustomerID, CustomerName, SalesRepEmployeeNumber
from customers;

--(f) Report total payments for Atelier graphique.
select CustomerNumber, sum(Amount) as totalpayment
from Payments
WHERE CustomerNumber like '103'
group by CustomerNumber

--(g) Report the total payments by date.
select PaymentDate, sum(Amount) as totalpayment
from payments
group by PaymentDate;

--(h) Report the products that have not been sold.
select ProductName from Products
where ProductCode in
(select ProductCode from Products
except
select Productcode from OrderDetails)

--(i) List the amount paid by each customer.
select CustomerNumber, sum(Amount) as amountpaid
from payments
group by CustomerNumber

--(j) List products sold by order date.
select p.productname, od.ordernumber, o.orderdate 
from Products p join OrderDetails od on od.ProductCode=p.ProductCode join orders o on
o.OrderNumber = od.OrderNumber;

--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
select p.ProductName, od.productcode, o.orderdate   
from Products p join OrderDetails od on od.ProductCode=p.ProductCode join orders o on
o.OrderNumber=od.OrderNumber
where ProductName like '1940 Ford Pickup Truck'
order by orderdate desc

--(l) List the names of customers and their corresponding order number where a particular order from
--that customer has a value greater than $25,000?
select c.customername, o.ordernumber, sum(od.quantityordered*od.priceeach) as ordertotal
from customers c join orders o on o.CustomerNumber=c.CustomerID join OrderDetails od on od.OrderNumber=o.OrderNumber
group by c.CustomerName, o.OrderNumber having sum(od.quantityordered*od.priceeach) > 25000;

--(m) Compute the commission for each sales representative, assuming the commission is 5% of the
--    value of an order. Sort by employee last name and First name.
select o.OrderNumber, e.LastName, e.FirstName, sum(od.quantityordered * od.priceeach) * .05 as Commission
from Employees e 
join customers c on c.SalesRepEmployeeNumber=e.EmployeeID 
join orders o on o.CustomerNumber=c.CustomerID 
join OrderDetails od on od.OrderNumber=o.ordernumber
group by o.OrderNumber, e.LastName, e.FirstName

--(n) What is the dierence in days between the most recent and oldest order date in the Orders file?
select DATEDIFF(day, MIN(OrderDate), MAX(orderdate)) as DayDifference
from orders

--(o) Compute the average time between order date and ship date for each customer ordered by the largest difference.

select o.CustomerNumber, c.CustomerName, avg(DATEDIFF(day,o.OrderDate, o.ShippedDate)) as avgtime
from orders o join customers c on c.CustomerID=o.CustomerNumber
where ShippedDate <> 'NULL'
group by o.CustomerNumber, c.CustomerName
order by avgtime desc