
create table Ragul_Intern
(
     SeqID int identity(1,1) primary key,
	 InternName  varchar(100) not null,
	 Batch varchar(10),
	 salary decimal(18,2) not null, check (salary>5000),
	 CreateDate date default getdate()
)
-- select the table
select * from Ragul_Intern

--Drops commands remove tables
drop table Ragul_Intern;

--truncate command used to delete all rows from the table
truncate table Ragul_Intern;

--Alters command allows you to alter the structure of the database
alter table Ragul_Intern add Age varchar(10);

--Insert command is used to insert data into the row of a table.
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Prakash','Python','6000','23')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Singaram','Java','7000','22')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('MOhan','Python','6000','23')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Siva','Java','6000','24')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Lokesh','Python','6000','21')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Praveen','Java','6000','23')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Arun','Python','7500','25')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Sridhar','Java','6500','24')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Muthu','Python','5500','23')
insert into Ragul_Intern (InternName,Batch,salary,Age) values ('Manish','Java','6200','24')

--update command is used to update or modify the value of a column in the table.
update Ragul_Intern Set salary='8000' Where SeqID=3
update Ragul_Intern set Batch='C#' where InternName='Manish'

--delete  command is used to remove one or more rows from a table.
delete from Ragul_Intern where SeqID=8


select * from Ragul_Intern where salary>7000

select * from Ragul_Intern where  Batch='Java'


---between
select InternName,Batch from Ragul_Intern where salary between '6000' and '7500'
-- Like
select * from Ragul_Intern where InternName like 'S%' or InternName like '%an'

select InternName,Batch from Ragul_Intern 
where salary between '6000' and '7500' and(InternName like 'S%' or InternName like '%an')

--distinct
select Distinct(Batch) from Ragul_Intern
order by Batch


select count(*)as distinctBatch 
from (select Distinct Batch from Ragul_Intern)
--------------------------------------------------------------
create table customs
(
  ID int identity(1,1) primary key,
  CustomerName varchar(20),
  Age int,
  CustomerAddress Varchar(25),
  Salary Decimal(18,2)
 )

 create table orders
 (
  OID int,
  customer_ID int,
  Amount decimal(18,2)
  )


 select * from customs

 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Ramesh','25','Delhi','20000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Kaushik','23','Mumbai','15000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Hardik','27','Bhopal','22000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('surya','22','Indore','10000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('vicky','32','kerala','12000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Mohan','25','Bangalore','25000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Prakash','24','Punjab','21500')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Suresh','26','Bihar','20000')
 insert into customs (CustomerName,Age,CustomerAddress,Salary) values('Prakash','26','Bihar','10000')
 
 select * from orders

 insert into orders(OID,customer_ID,Amount) values('102','3','3000')
 insert into orders (OID,customer_ID,Amount) values('100','3','1500')
 insert into orders (OID,customer_ID,Amount) values('101','2','1560')
 insert into orders (OID,customer_ID,Amount) values('103','4','2060')
 
--function

--inline function
 create function [dbo].[fncustoms]
 (
  @ID int
 )
 returns table as return
 (
  select * from customs where ID=@ID
  )

  select Age,CustomerName,CustomerAddress from dbo.fncustoms(5)
  select * from customs


  --trigger

  select * from customs
  select * from orders

  create table Samplestudenttable
  (
  StudentID int primary key,
  StudentName varchar(50) not null,
  Age int not null ,
  Addrees varchar(50) ,
  )

  create table Samplestudenttable_log
  (
   StudentID int,
   Action varchar(20),
   ATime datetime,
   )

   select * from  Samplestudenttable
   select * from Samplestudenttable_log

   insert into Samplestudenttable values(1,'Muthu',23,'salem')
   insert into Samplestudenttable values(2,'Kumar',23,'chennai')
   insert into Samplestudenttable values(3,'Dhanababu',23,'erode')

   update Samplestudenttable set Age=22 where StudentID=2

   delete from Samplestudenttable where StudentID=1

   create trigger Student_Trigger_Insert on  Samplestudenttable after insert
   as
   begin
        insert into Samplestudenttable_log select StudentID,'inserted',getdate() from inserted
   end
    

   create trigger Student_Trigger_Updates on  Samplestudenttable after update
   as
   begin
        insert into Samplestudenttable_log select StudentID,'update',getdate() from inserted
   end


   create trigger Student_Trigger_Deletes on  Samplestudenttable after delete
   as
   begin
        insert into Samplestudenttable_log select StudentID,'deleted',getdate() from deleted
   end



--index

create nonclustered index IX_customs_Salary on customs(Salary)
select * from customs where Salary=25000
