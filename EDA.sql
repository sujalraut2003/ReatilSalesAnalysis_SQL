---SQL Retail Sales Analysis ---
---Create Table
create table retail_sales 
      (
		transactions_id int primary key,
		sale_date date, 
		sale_time time,  
		customer_id int,
		gender varchar(15),
		age int,
		category varchar(15),
		quantiy int,
		price_per_unit float,
		cogs float,
		total_sale float
	  );

select * from retail_sales
where transactions_id is null
	  or
      sale_date is null
      or
	  sale_time is null
	  or 
	  customer_id is null
	  or
	  gender is null
	  or 
	  age is null
	  or 
	  category is null
	  or 
	  quantiy is null
	  or 
	  price_per_unit is null
	  or 
	  cogs is null
	  or
	  total_sale is null
	  
----Exploratory Data Analysis----
select year, month, avg_sales from
(
	select 
	extract(Year from sale_date) as year, 
	extract(Month from sale_date) as month,
	avg(total_sale) as avg_sales,
	rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
	from retail_sales 
group by 1,2
) as t1
where rank =1 

select customer_id, sum(total_sale) as total_sum from retail_sales
group by 1
order by 2 desc
limit 5

select category, count(distinct customer_id) as unique_customer
from retail_sales
group by category

select * ,
case 
when extract(Hour from sale_time) < 12 then 'morning'
when extract(Hour from sale_date) between 12 and 17 then 'afternoon'
else 'evening '
end as shift 
from retail_sales






















	  
	  
	  