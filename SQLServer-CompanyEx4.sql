.echo on
.headers on

-- Name: Israel Dixon
-- File Name: SQLQz03-dixon.sql
-- Date: Jan 26, 2021

--1.Write a report giving the employee id, First name, last name, and the average amount of all orders by
--that employee. Use the SQL 92 syntax. Do not use a group by clause.
select e.employeeid, e.firstname, e.lastname, avg(od.unitprice * od.quantity) as average_sale from employees e join orders o on e.employeeid = o.employeeid join order_details od on o.orderid = od.orderid group by e.employeeid;



--2.In some cities, we have customers, suppliers, and employees. Write a report that lists the customer's
--contact name, the supplier's contact name, the employee's name, and the city in which all three are
--located. Use the SQL 92 syntax. Do not use a group by clause.
select c.contactname as customer_contact, s.contactname as supplier_contact, (e.firstname || ' ' || e.lastname) as employee_name, e.city from customers c join suppliers s on c.city = s.city join employees e on s.city = e.city;