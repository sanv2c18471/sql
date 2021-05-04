select * from Stafftable

select * from Paymenttable

select * from Paymenttable order by 3
select * from Stafftable order by 2

select * from Stafftable where StaffName like 'S%' or StaffName like '%an'

--inner join--
select p.StaffID, s.StaffName,s.StaffAge,p.Amount
from Stafftable s inner join Paymenttable p
on s.ID=p.StaffID

--left join--
select p.StaffID,s.StaffName,s.StaffAge,p.Amount
from Stafftable s left join Paymenttable p
on s.ID=p.StaffID
order by StaffName asc

--right join--
select p.StaffID,s.StaffName,s.StaffAge,p.Amount
from Stafftable s right join Paymenttable p
on s.ID=p.StaffID
order by Amount desc

--full join--
select p.StaffID, s.StaffName,s.StaffAge, p.Amount
from Stafftable s full join Paymenttable p
on s.ID=p.StaffID
order by StaffAge desc

--union--
(select p.StaffID,s.StaffName, s.StaffAge, p.Amount
from Stafftable s left join Paymenttable p
on s.ID=p.StaffID)
union
(select p.StaffID, s.StaffName,s.StaffAge,p.Amount
from Stafftable s right join Paymenttable p
on s.ID=p.StaffID)

--union all--
(select p.StaffID,s.StaffName,s.StaffAge,p.Amount
from Stafftable s left join Paymenttable p
on s.ID=p.StaffID)
union all
(select p.StaffID,s.StaffName,s.StaffAge,p.Amount
from Stafftable s right join Paymenttable p
on s.ID=p.StaffID)
 
 exec test1

 create procedure test2
 as
  select StaffID,StaffName,StaffAge,Amount
  from Stafftable s inner join Paymenttable p
  on s.ID=p.StaffID
 go

 exec test2

 --sub queries--
select * from  Stafftable
where StaffAge in( select StaffAge from  Stafftable where StaffAge>24 )

--exist
select * from Paymenttable p where exists (select * from  Stafftable s where s.ID=p.StaffID)

select * from  Paymenttable p where not exists (select * from Stafftable s where s.ID=p.StaffID)

--function--

 create function [dbo].[fnStafftable1]
 (
  @ID int
 )
 returns table as return
 (
  select * from Stafftable where ID=@ID
  )

  select * from dbo.fnStafftable1(5)

  --trigger

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


   --row_number() over (partition by clos order by cols) as rno

select * from
(
   select * ,row_number() over (partition by ID order by StaffName desc) as rno
   from  Stafftable
) as s where rno=2

select * from
(
   select * ,row_number() over (partition by Amount order  by StaffID asc, Dates asc) as rno
   from Paymenttable
) as s where rno=1

 --TOP
 select top 3 * from Stafftable where MonthleyPackage>=20000

--group by--
select StaffAge, count(StaffAge) as countofstaffAge ,min(MonthleyPackage) as minpackage,max(MonthleyPackage) as maxpackage,avg(MonthleyPackage) as avgpackage,sum(MonthleyPackage) as sumpackage
from Stafftable
group by StaffAge

--having--
select StaffAge, count(StaffAge) as countofstaffAge ,min(MonthleyPackage) as minpackage,max(MonthleyPackage) as maxpackage,avg(MonthleyPackage) as avgpackage,sum(MonthleyPackage) as sumpackage
from Stafftable
group by StaffAge
having count(StaffAge)>1

--view--
create view Stafftable_View as
 
(select p.StaffID,s.StaffName, s.StaffAge, p.Amount
from Stafftable s left join Paymenttable p
on s.ID=p.StaffID)
union
(select p.StaffID, s.StaffName,s.StaffAge,p.Amount
from Stafftable s right join Paymenttable p
on s.ID=p.StaffID)

select * from Stafftable_View