/* Query 1: calculate the average of age of customers  based on their marital status */

select "Marital Status", avg(age)
from customer
group by "Marital Status";


/* Query 2: calculate the average of age of customers  based on their gender */

select 
	case 
		when gender = 0 then 'female'
		when gender = 1 then 'male'
	end as gender,
	avg(age) as average_age
from customer
group by gender;

/* Query 3: identify the name of the store with the highest total quantity */

select s.storename, sum(t.qty)
from store as s 
	left outer join transactions as t on s.storeid=t.storeid 
group by s.storeid, s.storename 
order by sum(t.qty) desc
limit 1;

/* Query 4: identify the best-selling product by highest total amount */

select p."Product Name", sum(t.totalamount)
from product as p 
	left outer join transactions as t on p.productid = t.productid 
group by p.productid, p."Product Name" 
order by sum(t.totalamount) desc
limit 1;