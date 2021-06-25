.echo on
.headers on

-- Name: Israel Dixon
-- File: SQLex01.sql
-- Date: January 15, 2021

drop table if exists Sneaker;

create table Sneaker (
  OrderID int NOT NULL,
  Brand text,
  ShoeYear int,
  Condition text,
  ShoeSize float
);

insert into Sneaker values (103542,'Jordan',2018,'Used',10.5);
insert into Sneaker values (100876,'Jordan',2020,'Used',12.5);
insert into Sneaker values (123990,'Nike',2010,'Used',7.0);
insert into Sneaker values (168722,'Adidas',2009,'Used',11.0);
insert into Sneaker values (167890,'Converse',1970,'Used',11.5);

select * from Sneaker;
select * from Sneaker where Brand like 'Nike';
select * from Sneaker where ShoeSize > 11.5;
select * from Sneaker where OrderID = 103542;
select * from Sneaker where ShoeYear = 1970;