.echo on
.headers on

-- Name: Israel Dixon
-- File Name: SQLEx02.israel.sql
-- Date:1/21/2021

--1. List the company name, the contact name and the country of all customers in Poland.
select companyname, contactname, country from customers where country like '%Poland%';

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipcity like '%Berlin%';

--3. How many boxes of Filo Mix do we have in stock?
select productid, productname, unitsinstock from products where productname like '%Filo Mix%';

--4. List the telephone numbers of all of our shippers.
select shipperid,companyname, phone from shippers;

--5. Who is our oldest employee? Who is our youngest employee?
select employeeid, lastname, firstname, Min (Birthdate) from employees;
select employeeid, lastname, firstname, max (Birthdate) from employees;



--6. List the suppliers where the owner of the supplier is also the sales contact.
select supplierid, companyname, contactname, contacttitle from suppliers where contacttitle like '%owner%';

--7. Mailing Labels
select contacttitle, contactname ||'
   '|| companyname ||'
   '|| address ||'
   '|| city, postalcode, country ||'
   '|| ' ' ||'
   '|| ' ' from customers;
	
--8. Telephone Book
select substr(contactname, instr(contactname,' '))||','||''||substr(contactname, instr(contactname, 1), (instr(contactname, ' ')-1))||' '||
   companyname || ' ' || phone from customers;



