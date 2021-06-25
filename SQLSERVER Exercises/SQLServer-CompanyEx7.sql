.echo on
.headers on

-- Name: Israel Dixon
-- File: lab2c-dixon.sql
-- Date: Jan 25, 2021

--1. List the employee IDs with the number of sales by each employee from most sales to least. I want to
--recognize the employees with the most sales.
select employeeid, count(orderid) from orders group by employeeid order by count (orderid) desc;

--2. I want to look at the average discounts taken by all customers for products that cost more than $50.00.
--Speciffcally, I want to know the average discount of all orders for each product from the highest price
--to the lowest price.
select productid, unitprice, printf("%.2f", avg(Discount)) as average_discount from order_details where unitprice > 50 group by productid order by unitprice desc;

--3. I am doing an analysis of which shippers ship to each country, and I need a report showing the number
--of orders each shipper delivered to each country and the number of orders. I don't need the data where
--the number of orders is ten or less, but I need the report listed by country and the number of orders
--shipped to that country.
select shipcountry, count(orderid) as total_orders, shipperid from orders group by shipperid , shipcountry having count(orderid) > 10 order by shipcountry, count(orderid) desc;

--4. For each order, what was the time lag between the order date and the ship date?
select orderid, orderdate, shippeddate, julianday(shippeddate) - julianday(orderdate) as lag from orders order by lag desc;

--5. Continuing with the previous query, I need the average time lag for each shipper.
select shipperid, avg(julianday(shippeddate) - julianday(orderdate)) as lag from orders group by shipperid order by lag;

--6. I am doing inventory, and I need to know the total price of each product on hand, that is, the price of
--each product line, sorted alphabetically by product name.
select productid, productname, unitsinstock, unitprice, unitsinstock * unitprice as total from products where unitsinstock > 0 order by productname;

--7. What is the dollar total we have tied up in inventory?
select sum(unitsinstock * unitprice) from products;

--8. We have discovered that some customers favor certain employees. I need to know this information. I
--need a report of the most common employee/customer pairs, the nuber of times the employee took
--orders from the customer, and the number of orders. Alphabetize this by customer id. Omit customer/employee pairs whre the --number of orders is less than five.

--9. How many days were in the service (if you are a veteran), or how many days will you serve (assuming
--you know your ETS date)?
select julianday('2020-07-04') - julianday('2016-07-04') as daysIn;