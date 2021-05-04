use LearningDB;
create table customs111
(
  ID int identity(1,1) primary key,
  CustomerName varchar(20),
  Age int,
  CustomerAddress Varchar(25),
  Salary int
 )
 create table orders111
 (
  OID int,
  customer_ID int,
  Amount decimal(18,2)
  )

 select * from customs111

 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Ramesh','25','Delhi','20000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Kaushik','23','Mumbai','15000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Hardik','27','Bhopal','22000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('surya','22','Indore','10000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('vicky','32','kerala','12000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Mohan','25','Bangalore','25000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Prakash','24','Punjab','21500')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Suresh','26','Bihar','20000')
 insert into customs111 (CustomerName,Age,CustomerAddress,Salary) values('Prakash','26','Bihar','10000')
 
 select * from orders111

 insert into orders111(OID,customer_ID,Amount) values('102','3','3000')
 insert into orders111 (OID,customer_ID,Amount) values('100','3','1500')
 insert into orders111 (OID,customer_ID,Amount) values('101','2','1560')
 insert into orders111 (OID,customer_ID,Amount) values('103','4','2060')
 
  --inner join
 select ID,CustomerName,Age,Amount
 from customs111 c,orders111 o
 where c.ID=o.customer_ID

 --left join
 select ID,CustomerName,Age,Amount
 from customs111 c
 left join orders111 o
 on c.ID=o.customer_ID

 --right join
 select ID,CustomerName,Age,Amount
 from customs111 c
 right join orders111 o
 on c.ID=o.customer_ID

 --full join

 select ID,CustomerName,Age,Amount
 from customs111 c
 full join orders111 o
 on c.ID=o.customer_ID



 select * from Ttbl_Department
select * from Ttbl_Student

select * from Ttbl_Department
where DeptID in(Select DeptID from Ttbl_Student)





 select * from Ttbl_Department
select * from Ttbl_Student
select * from Ttbl_Student s where exists (select * from Ttbl_Department d where s.DeptID=d.DeptID)

select * from Ttbl_Student s where not exists (select * from Ttbl_Department d where s.DeptID=d.DeptID


select * from Ttbl_Student
select StudRank,max(StudentName)as studentName
from Ttbl_Student s
group by StudRank


select max(DOB) as DOB
from Ttbl_Student


  select * from Ttbl_Student
  select DeptID,max(DOB) as DOB
  from Ttbl_Student
  group by DeptID
   

     select s.DeptID,MIN(S.StudentName) as StudentName,s.DOB
  from Ttbl_Student s
  inner join
  (
   select s.DeptID,min(DOB) as DOB
  from Ttbl_Student s inner join Ttbl_Department d on s.DeptID=d.DeptID
  group by s.DeptID
  )d on s.DeptID= d.DeptID  and s.DOB=d.DOB
  group by S.DeptID,S.DOB

  select * from Ttbl_Department
select * from Ttbl_Student

insert into Ttbl_Student (StudID,DeptID,StudentName,DOB,StudRank)  values(6,3,'Kala',2020-05-12,3);
  
select * from
(
   select * ,row_number() over (partition by StudRank order by DOB) as rno
   from Ttbl_Student
) as s where rno=1

select * from
(
   select * ,row_number() over (partition by DeptID order  by StudentName desc, DOB asc) as rno
   from Ttbl_Student
) as s where rno=1


select * from Ragul_Intern


   select * ,row_number() over (partition by InternName order by SeqId) as rno
   from Ragul_Intern




