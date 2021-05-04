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
 
  --inner join
 select ID,CustomerName,Age,Amount
 from customs c,orders o
 where c.ID=o.customer_ID

 --left join
 select ID,CustomerName,Age,Amount
 from customs c
 left join orders o
 on c.ID=o.customer_ID

 --right join
 select ID,CustomerName,Age,Amount
 from customs c
 right join orders o
 on c.ID=o.customer_ID

 --full join

 select ID,CustomerName,Age,Amount
 from customs c
 full join orders o
 on c.ID=o.customer_ID


use LearningDB

select * from Ttbl_Department
select * from Ttbl_Student

--inner join
select s.StudID,s.StudentName,s.DOB, d.DepartmentName
from Ttbl_Department d
inner join Ttbl_Student s
on d.DeptID=s.DeptID

--Left join
select *
from Ttbl_Department d
left join Ttbl_Student s
on d.DeptID=s.DeptID

--Right join
select *
from Ttbl_Department d
right join Ttbl_Student s
on d.DeptID=s.DeptID

--full join
select *
from Ttbl_Department d
full join Ttbl_Student s
on d.DeptID=s.DeptID

--sub query
select * from Ttbl_Student 
where DeptID in(Select DeptID from Ttbl_Student)

--exists
select * from Ttbl_Student s where exists (select * from Ttbl_Department d where s.DeptID=d.DeptID)

select * from Ttbl_Student s where not exists (select * from Ttbl_Department d where s.DeptID=d.DeptID)


select DeptID,max(StudentName)as studentName
from Ttbl_Student s
group by DeptID

select * from Ttbl_Student

select max(DOB) as DOB
from Ttbl_Student

select *
from Ttbl_Student 


  select * from Ttbl_Student
  select DeptID,max(DOB) as DOB
  from Ttbl_Student
  group by DeptID
   
  select DepartmentName,StudentName
  from Ttbl_Department d
  left join Ttbl_Student s
  on d.DeptID=s.DeptID


  select s.DeptID,MIN(S.StudentName) as StudentName,s.DOB
  from Ttbl_Student s
  inner join
  (
   select s.DeptID,min(DOB) as DOB
  from Ttbl_Student s inner join Ttbl_Department d on s.DeptID=d.DeptID
  group by s.DeptID
  )d on s.DeptID= d.DeptID  and s.DOB=d.DOB
  group by S.DeptID,S.DOB
