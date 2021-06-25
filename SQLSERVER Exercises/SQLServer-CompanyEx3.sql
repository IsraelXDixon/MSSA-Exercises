.echo on
.headers on

--  Name: Israel Dixon
--  File: SQLQz02.israel.sql
--  Date: Jan 20, 2021

--1. How many seafood products do we have?
select count (*) from products where categoryid = 8;

--2. What are the names and IDs of our seafood products?.
select productid, productname from products where categoryid = 8;

--3. What is the average price of our seafood products?
select avg (unitprice) from products where categoryid = 8;

--4. What is our highest priced seafood product, and how much does it cost?
select productid, productname, max (Unitprice) from products where categoryid = 8;

--5. What is our lowest priced seafood product, and how much does it cost?
select productid, productname, min (Unitprice) from products where categoryid = 8;

--6. How many customers do we have in Denmark?
select count(*) from customers  where country like 'Denmark';

--7. What are the customer names and IDs of our Danish customers?
select customerid, contactname from customers where country like 'Denmark';

--8. Which customers do NOT have a fax number? This one is very tricky!
select customerid, contactname, fax from customers where (length (fax) > 14) or (length (fax) < 11); 
