--Name: Israel Dixon
--File: SQLEx5-sql
--Date: Feb 10, 2021

-- this is part 1
create table PresidentsInfo
(
ID						varchar(50),
LastName				varchar(50),
FirstName				varchar(50),		
MiddleName				varchar(50),		
OrderofPresidency		varchar(50),			
DateofBirth				varchar(50),			
DateofDeath				varchar(50),	
TownorCountyofBirth		varchar(50),			
StateofBirth			varchar(50),		
HomeState				varchar(50),			
PartyAffiliation		varchar(50),			
DateTookOffice			varchar(50),			
DateLeftOffice			varchar(50),			
AssassinationAttempt	varchar(50),			
Assassinated			varchar(50),			
ReligiousAffiliation	varchar(50),
ImagePath				Varchar(50));
-- this is part 2 bulk insert 
bulk insert PresidentsInfo from 'C:\Users\supre\MSSA2021\ISTA420\Excercises\SQLPresidents.txt'
with (DATAFILETYPE = 'char',FIELDTERMINATOR = ',',ROWTERMINATOR = '\n')

select * from PresidentsInfo;
-- THIS IS PART 3
Alter table PresidentsInfo 
	drop COLUMN ImagePath;
-- THIS IS PART 4
DELETE FROM PresidentsInfo 
WHERE ID = 'ID';

SELECT * FROM PresidentsInfo
WHERE ID = 'ID';

--ALTER TABLE PresidentsInfo ALTER COLUMN MiddleName IS NULL;

ALTER TABLE PresidentsInfo
	ALTER COLUMN ID int not null;
ALTER TABLE PresidentsInfo
	ADD CONSTRAINT ID primary key(ID);
ALTER TABLE PresidentsInfo
	ALTER COLUMN DateofBirth date;
ALTER TABLE PresidentsInfo
	ALTER COLUMN DateofDeath date;
ALTER TABLE PresidentsInfo
	ALTER COLUMN DateTookOffice date;
ALTER TABLE PresidentsInfo
	ALTER COLUMN DateLeftOffice date;
-- HOW TO UPDATE A ROW. STEP 5 
update PresidentsInfo set DateLeftOffice = '2017-01-20' , AssassinationAttempt = 'false' , Assassinated = 'false'
	   WHERE ID = '44';
-- HOW TO ADD NEW ROWS STEP 6
	insert into PresidentsInfo
	values ('45','Trump','Donald','John','45','1946-6-14',NULL,'Queens','New York','New York','Republican', '2017-01-20','2021-01-20','false','false','Christian')

	insert into PresidentsInfo
	values ('46','Biden','Joe','Robinette','46','1942-11-20',NULL,'Scranton','Pennsylvania','Pennsylvania','Democratic', '2021-01-20',NULL,'false','false','Catholic')

	update PresidentsInfo set PartyAffiliation = 'Democratic'
	   WHERE ID = '46';
-- STEP 7 PIVOT

select *
from 
(select ID, HomeState, PartyAffiliation
	from PresidentsInfo) as pivot1
pivot(
count(ID)
for PartyAffiliation in ([Democrat],[Democratic],[Democratic-Republican],[Democratic-Republican/National Republican],
[Democratic/National Union],[Federalist],[Independent],[Republican],[Republican/National Union],[Whig])) as PresPivot
--STEP 8 DATEDIFF
SELECT firstname, Lastname, DATEDIFF(day, DateTookOffice, DateLeftOffice) as daysinoffice from PresidentsInfo;

SELECT firstname, Lastname, DATEDIFF(YEAR, DateofBirth, DateTookOffice) as age from PresidentsInfo;

select distinct PartyAffiliation from PresidentsInfo;
--STEP 9 PIVOT
select *
from 
(select ID, PartyAffiliation, ReligiousAffiliation
	from PresidentsInfo) as pivot2
pivot(
count(ID)
for ReligiousAffiliation in ([Baptist],[Catholic],[Christian],[Congregationalist],[Deist/Episcopalian],
[Disciples of Christ],[Dutch Reformed],[Episcopalian],[Methodist],[Presbyterian],[Presbyterian/Methodist],
[Quaker],[Roman Catholic],[Unaffiliated Christian],[Unitarian])) as PresReliPivot

select distinct ReligiousAffiliation from PresidentsInfo;

select * from PresidentsInfo;
