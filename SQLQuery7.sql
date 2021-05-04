create table Ragul_TblEmployee
(
  EmployeeID int identity primary key,
  EmployeeName varchar(100) not null,
  Gender Varchar(10) not null,
  StateCode varchar(20) not null,
  Salary decimal(18,2) not null
  )
 select * from Ragul_TblEmployee

insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Muthu','M','IN',83000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Mohan','M','JP',88000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Arun','M','IN',76000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Prakash','M','JP',93000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Athira','F','IN',85000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Soundharya','F','JP',92000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Vinith','M','AM',71000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Ranjani','F','AM',72000)
insert into Ragul_TblEmployee(EmployeeName,Gender,StateCode,Salary)values('Praveen','M','Ge',58000)

----------------------------------The CASE statement and comparison operator--------------------------------

select EmployeeName,
case
 when Salary>=90000 and Salary<=100000 then 'Software Developer'
 when Salary>=80000 and Salary<=90000 then 'Web Developer'
 when Salary>=70000 and Salary<=79000 then 'Data Analyst'
 else 'HR'
 End as Roles
 from Ragul_TblEmployee

----------------------------Case Statement with Order by clause---------------------------------------

Select EmployeeName,Gender,Salary
from Ragul_TblEmployee
order by  case Gender
when 'F' then Salary end DESC,
case when Gender='M' then Salary 
end

-------------------------Update statement with a CASE statement---------------------------------------
update Ragul_TblEmployee
set StateCode  = case StateCode
 when 'AM' then 'AUS' 
 when 'GE' then 'AL'  
 end

-------------------------Insert statement with CASE statement-----------------------------------------

Declare @EmployeeName varchar(100)
Declare @Gender int
Declare @Statecode char(2)
Declare @salary decimal(18,2)
Set @EmployeeName='Rohit'
Set @Gender=0
Set @Statecode='FL'
set @salary=52000

Insert into Ragul_TblEmployee
values 
(@EmployeeName,
CASE @Gender
WHEN 0 THEN 'M'
WHEN 1 THEN 'F'
end,
@Statecode,
@salary)

-----------------------------------------------------------------------------------------------------------
Select * from tbl_Studentdetails 
 Select *,
Case When Tamil <=70 Then Tamil else 0 end + Case When English <=70 Then English else 0 end +
Case When Maths <=70 Then Maths else 0 end + Case When Science <=70 Then Science else 0 end + 
Case When Social <=70 Then Social else 0 end as LTEQ70,
Case When Tamil > 70 Then Tamil else 0 end + Case When English > 70 Then English else 0 end +
Case When Maths > 70 Then Maths else 0 end + Case When Science > 70 Then Science else 0 end + 
Case When Social > 70 Then Social else 0 end as GT70
from tbl_Studentdetails

select * from tbl_Customer

Select * from tbl_Customer order by lastname desc
Select * from tbl_Customer where stateCode = 'MA' order by totalsales desc
---------------------------------------------------------------------------------------------------------

 ----------------------------Pivot------------------------------------------------------------------------
create table CourseTable
(
  CourseName varchar(50) not null,
  CourseCategory varchar(50) not null,
  CoursePrice int not null
)
select * from CourseTable

insert into CourseTable values('C','Programming',5000)
insert into CourseTable values('Django','Web Development',7000)
insert into CourseTable values('C++','Programming',5500)
insert into CourseTable values('SQL','Backend Development',8000)
insert into CourseTable values('Python','Data Science',10000)
update CourseTable set  CourseCategory='program' where CourseName='C++' 

select * from
(
  select CourseName,CourseCategory,CoursePrice
  from CourseTable
) as r
pivot(
 sum(CoursePrice)
 for CourseCategory
 in([Programming],[Web Development],[Program],[Backend Development],[Data Science])
 ) as pivottable
  ------ differnt method in pivot---------------------
 select * from
(
  select CourseName,CourseCategory,CoursePrice
  from CourseTable
) as m
pivot(
 sum(CoursePrice)
 for CourseName
 in([C],[Django],[C++],[SQL],[Python])
 ) as pivottable

-------------------------pivot---------------------------------
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

---------------- task------------------------------------
Select * from tbl_Studentdetails 

Select * From
(
    Select IsNull(Kala,'') + IsNull(Suresh,'') + Isnull(Mani,'') as Student,Subject,Marks from
    (
        Select * from
        (
            Select * from tbl_Studentdetails
        ) as S
        PIVOT
        (
            Max(StudentName)
            For StudentName in ([Kala],[Suresh],[Mani])
        ) as Pvt
    ) as S
    UNPIVOT
    (
        Marks for Subject in ([Tamil],[English],[Maths],[Science],[Social])
    ) as UnPvt
) as S
PIVOT
(
    Max(Marks) for Student in ([Kala],[Suresh],[Mani])
) as pvt