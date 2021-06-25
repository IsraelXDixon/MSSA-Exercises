-- Name: Israel Dixon
-- File Name: SQLEx4-dixon
-- Date: Feb 5, 2021

use TSQLV4;
go

--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.
declare @custnumber as int = 10;

select custid, orderyear, count(distinct productid) countproduct
from (select o.custid, year(o.orderdate) orderyear, od.productid
     from sales.orderdetails od join Sales.Orders o on od.orderid = o.orderid) table1
where table1.custid = @custnumber
group by custid, orderyear
order by custid, orderyear;

--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.

declare @country nvarchar(15) = N'France';
with T1 (Country, OrderYear, ProductId)
as
(select c.country, year(o.orderdate), od.productid
from sales.orderdetails od join sales.orders o on od.orderid = o.orderid 
     join  sales.customers c on c.custid = o.custid
),
T2 (Country, OrderYear, NumberOfProducts)
as
( select T1.Country, T1.OrderYear, count(distinct T1.ProductId)
from T1
group by Country, OrderYear
)
Select Country, OrderYear, NumberOfProducts
from T2
where Country = @country
order by Country, OrderYear

--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.

drop view if exists sales.VOrderTotalsByCountry;
GO
create view sales.VOrderTotalsByCountry
as
select c.country, Year(o.orderdate) as OrderYear, sum(od.unitprice * od.qty) as TotalAmount
from sales.customers c
	join sales.Orders o on c.custid = o.custid
	join sales.orderdetails od on o.orderid = od.orderid
group by c.country, year(o.orderdate)
GO

--4. Create an inline table valued function that accepts as a parameter a country name and returns a table
--with the distinct products ordered by customers from that country. Products are to be identied by
--both product ID and product name.

drop function if exists sales.getCustomerProducts;
go
create function sales.getCustomerProducts(@countryname nvarchar(15)) returns table
as return
select distinct p.productid, p.productname, c.country
from sales.customers c
join sales.orders o on c.custid = o.custid
join sales.orderdetails od on o.orderid = od.orderid
join production.products p on od.productid = p.productid
where c.country = @countryname
GO
select * from sales.getCustomerProducts(N'Germany')
order by productid;

--5. Use the CROSS APPLY operator to create a query showing the top three products shipped to customers
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.

select * from(

select ROW_NUMBER() over(partition by country order by country) as row#, 
c.country, b.productname, b.productid, sum(a.qty) as Qty from sales.Orders o
cross apply
(select * from
Sales.OrderDetails od
where o.orderid = od.orderid) a
cross apply
(select * from Production.Products p
where p.productid = a.productid) b
cross apply
(select * from 
sales.customers c
where c.custid = o.custid) c
group by c.country, b.productname, b.productid
) SQ1
where row# <= 3
order by country, Qty desc
