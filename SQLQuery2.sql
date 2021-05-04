use LearningDB;

create table custom(
id int identity(1,1) primary key,
custom_name varchar(20),
Custom_age int,
custom_address varchar(20),
salary decimal(10,2));

create table deliveryorder(
deliveryorder_id int,
custom_id int,
amount decimal(18,2));


  select*from custom;

 insert into custom(custom_name,Custom_age,custom_address,salary) values('Ram','25','Delhi','20000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Kavin','23','Mumbai','15000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Hema','27','Bhopal','22000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('siva','22','Indore','10000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('vinoth','32','kerala','12000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Monika','25','Bangalore','25000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Pram','24','Punjab','21500')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Sam','26','Bihar','20000')
 insert into custom(custom_name,Custom_age,custom_address,salary) values('Tom','26','Bihar','10000')
 
 select * from deliveryorder

 insert into deliveryorder(deliveryorder_id,custom_id,amount) values('102','3','3000')
 insert into deliveryorder(deliveryorder_id,custom_id,amount) values('100','3','1500')
 insert into deliveryorder(deliveryorder_id,custom_id,amount) values('101','2','1560')
 insert into deliveryorder(deliveryorder_id,custom_id,amount) values('103','4','2060')
 
 
 --Aggegative function

 --Distinct
 select  distinct salary from custom;

 --Orderby
 select * from custom order by custom_name;
 select custom_name,custom_address from custom order by custom_name desc,custom_address asc; 
 select * from custom order by custom_name asc,custom_address desc;

  --TOP
  select top 3 * from custom where Custom_age>20;
  select top 5 Custom_age,salary from custom where salary>=20000;

  --group by
  select custom_name ,count(1) as NO_OFFER, sum(salary) as total
  from custom 
  group by custom_name;

  --Max and Min
  select max(Custom_age) as MAX_Age from custom;
  select min(Custom_age) as MAX_Age from custom;

 --inner join
 select id,custom_name,Custom_age,amount
 from custom c, deliveryorder d
 where c.id=d.custom_id;

  --left join
   select id,custom_name,Custom_age,amount
 from custom c
 left join deliveryorder d
 on c.id=d.custom_id;
 
 --right join
 select id,custom_name,Custom_age,amount
 from custom c
 right join deliveryorder d
 on c.id=d.custom_id;

  --union
 select id,custom_name,Custom_age,amount
 from custom c
 left join deliveryorder d
 on c.id=d.custom_id
 union
 select id,custom_name,Custom_age,amount
 from custom c
 right join deliveryorder d
 on c.id=d.custom_id;

 --union all
 (select id,custom_name,Custom_age,amount
 from custom c
 left join deliveryorder d
 on c.id=d.custom_id)
 union all
 (select id,custom_name,Custom_age,amount
 from custom c
 right join deliveryorder d
 on c.id=d.custom_id);

 --full join
 select id,custom_name,Custom_age,amount
 from custom c
 full join deliveryorder d
 on c.id=d.custom_id;

