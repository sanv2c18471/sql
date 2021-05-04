use LearningDB;
create table [tbl_Emp](
[id] int primary key,
[name] nvarchar(10),
[salary] int,
[gender] nvarchar(10),
[city] nvarchar(10))

execute SP_helpindex tbl_Emp

insert into tbl_Emp values(3,'john',4500,'male','newyork');
insert into tbl_Emp values(1,'sam',3500,'male','london');
insert into tbl_Emp values(4,'sara',5500,'female','tokyo');
insert into tbl_Emp values(5,'todd',3100,'male','mumbai');
insert into tbl_Emp values(2,'pam',6500,'female','delhi');

select * from tbl_Emp


--index
create index IX_tbl_Emp 
on tbl_Emp (salary desc)

drop index tbl_Emp.PK__tbl_Emp__3213E83FB43C3B5E;






create table [tbl_Emp3](
[id] int primary key,
[name] nvarchar(10),
[salary] int,
[gender] nvarchar(10),
[city] nvarchar(10))



execute SP_helpindex tbl_Emp

insert into tbl_Emp3 values(3,'john',4500,'male','newyork');
insert into tbl_Emp3 values(1,'sam',3500,'male','london');
insert into tbl_Emp3 values(4,'sara',5500,'female','tokyo');
insert into tbl_Emp3 values(5,'todd',3100,'male','mumbai');
insert into tbl_Emp3 values(2,'pam',6500,'female','delhi');


--clustered index
create clustered index IX_tbl_Emp3 
on tbl_Emp3 (gender asc, salary desc)











create table [tbl_Emp2](
[id] int primary key,
[name] nvarchar(10),
[salary] int,
[gender] nvarchar(10),
[city] nvarchar(10))


insert into tbl_Emp2 values(3,'john',4500,'male','newyork');
insert into tbl_Emp2 values(1,'sam',3500,'male','london');
insert into tbl_Emp2 values(4,'sara',5500,'female','tokyo');
insert into tbl_Emp2 values(5,'todd',3100,'male','mumbai');
insert into tbl_Emp2 values(2,'pam',6500,'female','delhi');

--non clustered index
create clustered index IX_tbl_Emp2 
on tbl_Emp2 (name asc)


--unique
create table [tbl_Emp4](
[id] int primary key,
[F_name] nvarchar(10),
[L_name] nvarchar(10),
[salary] int,
[gender] nvarchar(10),
[city] nvarchar(10))


insert into tbl_Emp4 values(1,'john','nelson',4500,'male','newyork');
insert into tbl_Emp4 values(2,'sam','rai',3500,'male','london');

select*from tbl_Emp4;

--unique non cluster index
create unique nonclustered index
UIX_tbl_Emp4_F_name_L_name
on tbl_Emp4(F_name,L_name)

insert into tbl_Emp4 values(2,'john','nelson',4500,'male','newyork');
insert into tbl_Emp4 values(1,'sam','rai',3500,'male','london');
insert into tbl_Emp4 values(4,'sara','devi',5500,'female','tokyo');
insert into tbl_Emp4 values(5,'todd','sop',3100,'male','mumbai');

--store procedure
create procedure sp_procedure
as
begin
select name,gender from tbl_Emp
end
--call
sp_procedure

-- store procedure with parameter
create procedure sp_procedurebygender_bycity
@gender nvarchar(20),
@city nvarchar(20)
as
begin
select gender,city from tbl_Emp where gender=@gender and  city =@city
end
--call
sp_procedurebygender_bycity @gender='male',@city='london';

--pivot
create table sales1(
sales_agent varchar(20),
country varchar(10),
sales_amount decimal(10,2));

insert into sales1 values('david','india',960);

insert into sales1 values('david','us',520);

insert into sales1 values('john','india',970);

insert into sales1 values('david','us',540);

select * from sales1;


--condition for pivot

select sales_agent,india,us
from sales1
pivot(
sum(sales_amount)
for country in(india,us)
)as p

select sales_agent,country,sales_amount
from sales1
unpivot(
 sales_amount
for country in([india],[us])
)as UP;



