select * from Ttbl_Department
select * from Ttbl_Student

--row_number() over (partition by clos order by cols) as rno

select * from
(
   select * ,row_number() over (partition by DeptID order by DOB) as rno
   from Ttbl_Student
) as s where rno=1

select * from
(
   select * ,row_number() over (partition by DeptID order  by StudentName desc, DOB asc) as rno
   from Ttbl_Student
) as s where rno=1

create table Ragul_Intern
(
     SeqID int identity(1,1) primary key,
	 InternName  varchar(100) not null,
	 Batch varchar(10),
	 salary decimal(18,2) not null, check (salary>5000),
	 CreateDate date default getdate()
)

select * from Ragul_Intern

alter table Ragul_Intern add Age varchar(10);


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

select * from
(
   select * ,row_number() over (partition by Batch order by Age) as rno
   from Ragul_Intern
) as s where rno=1
