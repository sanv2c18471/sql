use LearningDB;
create table sales(
customer_name varchar(20),
product_name varchar(20),
amount decimal(10,2),
vendor_name varchar(20));
select*from sales;
insert into  sales values('abi','shoe',119,'bata');
insert into  sales values('ram','shoe',210,'bata');
insert into  sales values('sham','belt',100,'lether');
insert into  sales values('abi','shirt',203,'oto');
insert into  sales values('abi','shoe',300,'bata');
insert into  sales values('lina','shirt',120,'oto');

--partition,rank,dense rank
select
--row_number() over(order by customer_name) as order_number,
row_number() over(partition by vendor_name order by vendor_name) as vendororder_number,
--rank() over(order by customer_name) as customer_numberrank,
--dense_rank() over(order by customer_name) as customerdense_rank,
      customer_name, 
      product_name,
      amount, 
     vendor_name 
from sales;
