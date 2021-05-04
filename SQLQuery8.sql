create table Rk_TableCustomers
(
  CustomersID int identity(1,1) primary key,
  CustomersName varchar(100),
  CustomersCity varchar(100),
  CustomersMail varchar(100)
 )

 select * from Rk_TableCustomers

 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Mohan','Salem','Mohantm@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Prakash','Namakkal','PrakashRaj@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Sivagopal','Chennai','Sivamsg@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Singu','Erode','Singu75@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Praveenkumar','Salem','Asp@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Praveen','Bangalore','Gpraveen@gmail.com')
 insert into Rk_TableCustomers( CustomersName, CustomersCity,CustomersMail) values('Raghava','Madurai','Raghava12@gmail.com')

 create table Rk_TableOrders
(
  OrderID int identity(1,1) primary key,
  CustomersID int , 
  OrderTotal float,
  DiscountRate float,
  Orderdate date
 )

 select * from Rk_TableOrders

 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(2,1756.23,15.3,'03-Jan-2019')
 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(5,608.13,9.5,'26-Feb-2019')
 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(8,3250.00,10.0,'02-Dec-2019')
 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(4,1756.23,11.5,'03-Jan-2020')
 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(1,4000,20.5,'21-Mar-2021')
 insert into Rk_TableOrders(CustomersID,OrderTotal,DiscountRate,Orderdate) values(10,5230.10,25,'25-Dec-2018')

 create table Rk_TableSales
(
  SalesID int  identity(1,1) primary key, 
  OrderID int,
  SalesTotal float
)

 select * from Rk_TableSales

 insert into Rk_TableSales(OrderID,SalesTotal)values(3,370.95)
 insert into Rk_TableSales(OrderID,SalesTotal)values(4,882.33)
 insert into Rk_TableSales(OrderID,SalesTotal)values(12,370.95)
 insert into Rk_TableSales(OrderID,SalesTotal)values(13,370.75)
 insert into Rk_TableSales(OrderID,SalesTotal)values(1,750.95)
 insert into Rk_TableSales(OrderID,SalesTotal)values(57,882.33)

 select * from Rk_TableCustomers
 select * from Rk_TableOrders
 select * from Rk_TableSales


 --multiple tables using joins--
 ----inner join--------------
 select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 INNER JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 INNER JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID

 select CustomersName, CustomersCity, CustomersMail, S.SalesTotal
 FROM  Rk_TableCustomers C
 left JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 left JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID

----------------------------------------left join------------------------------------------------------
 select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 INNER JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 left JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID
 ------------------------is not null--------------------------------
 select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 INNER JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 left JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID
 where S.SalesTotal is not null

 -----------------------------------right join-------------------------
 select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 INNER JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 right JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID

 --------------right join and left join------------------------------
select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 right JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 left JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID

 ------------------------------full join-------------------------------
 select CustomersName, CustomersCity, CustomersMail, SalesTotal
 FROM  Rk_TableCustomers C
 full JOIN
 Rk_TableOrders O
 ON C.CustomersID = O.CustomersID
 full JOIN
 Rk_TableSales S
 ON O.OrderID = S.OrderID

 where S.SalesTotal is not null

 --pivot--
 create table Rk_EmployeeTable
 (
   EmployeeID int  primary key,
   EmployeeName varchar(100) not null,
   Age int not null,
   DOB Date not null
 )

 create table Rk_EmployeeSalaryTable
 (
   EmployeeNo int foreign key references  Rk_EmployeeTable(EmployeeID),
   Year int ,
   Salary Numeric(20,2)
 )

 insert into Rk_EmployeeTable values(1,'Mohan',23,'06-Jan-1998')
 insert into Rk_EmployeeTable values(2,'Siva',24,'30-June-1997')
 insert into Rk_EmployeeTable values(3,'Ragul',23,'26-Jan-1998')
 insert into Rk_EmployeeTable values(4,'Prakash',24,'04-Nov-1997')

 insert into  Rk_EmployeeSalaryTable values(1,2019,20000)
 insert into  Rk_EmployeeSalaryTable values(1,2020,22000)
 insert into  Rk_EmployeeSalaryTable values(1,2021,25000)

 insert into  Rk_EmployeeSalaryTable values(2,2019,25000)
 insert into  Rk_EmployeeSalaryTable values(2,2020,25000)
 insert into  Rk_EmployeeSalaryTable values(2,2021,25000)

 insert into  Rk_EmployeeSalaryTable values(3,2019,20000)
 insert into  Rk_EmployeeSalaryTable values(3,2020,22000)
 insert into  Rk_EmployeeSalaryTable values(3,2021,25000)

 insert into  Rk_EmployeeSalaryTable values(4,2019,20000)
 insert into  Rk_EmployeeSalaryTable values(4,2020,22000)
 insert into  Rk_EmployeeSalaryTable values(4,2021,25000)

 select * from  Rk_EmployeeTable
 select * from  Rk_EmployeeSalaryTable

 --with pivot--
  select EmployeeID,EmployeeName,[2019],[2020],[2021]
  from
  (  
    select E.EmployeeID,E.EmployeeName,ES.Year,sum(ES.Salary) Salary from  Rk_EmployeeTable E
    left join Rk_EmployeeSalaryTable ES
    on E.EmployeeID=ES.EmployeeNo
    group by E.EmployeeID,E.EmployeeName,ES.Year
  )EmployeeSalary_Details
  pivot
  (
    sum(Salary) 
	for year 
	in([2019],[2020],[2021])
) as Employeepivot
order by EmployeeID


--------------------pivot-------------------------------------------------

create table Rk_StudentsTable
(
	Id int PRIMARY KEY IDENTITY,
	StudentName varchar (50),
	Course varchar (50),
	Score int
)
insert into Rk_StudentsTable values ('Singu', 'Maths', 195 )
insert into Rk_StudentsTable VALUES ('Singu', 'Computer',182)
insert into Rk_StudentsTable values ('Singu', 'Chemistry',194 )
insert into Rk_StudentsTable values ('Singu', 'Physics', 190 )
insert into Rk_StudentsTable values ('Vinith', 'Maths', 186 )
insert into Rk_StudentsTable VALUES ('Vinth', 'Computer',190)
insert into Rk_StudentsTable values ('Vinth', 'Chemistry',191 )
insert into Rk_StudentsTable values ('Vinth', 'Physics', 180 )

update Rk_StudentsTable set StudentName ='Vinth' where ID=5

select * from Rk_StudentsTable

select * from
(
  select StudentName,Course,Score 
  from Rk_StudentsTable
) as st
pivot 
(
  sum(Score)
  for Course
  in([Maths],[Computer],[Chemistry],[Physics])
) as spt

--------------------unpivot-------------------------------------------------
create table Rk_StudentsTable1
(
   ID int identity primary key,
   StudentName varchar(50),
   Maths int,
   Computer int,
   Chemistry int,
   Physics int
)

insert into Rk_StudentsTable1 values ('Singu',195,182,194,190)
insert into Rk_StudentsTable1 values ('Vinth',186,190,191,180)

select * from Rk_StudentsTable1

select StudentName,Course,Score 
from Rk_StudentsTable1
unpivot
(
  Score
  for Course
  in(Maths,Computer,Chemistry,Physics)
  ) as spt1