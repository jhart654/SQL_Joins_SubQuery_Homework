-- #1
select customer.first_name, customer.last_name, customer.address_id, address.district 
from customer  
full join address
on customer.address_id = address.address_id
where address.district = 'Texas'

-- #2
select customer.first_name, customer.last_name, customer.customer_id, payment.amount 
from customer 
full join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99

-- #3
select *
from customer 
where customer_id IN(
	select customer_id 
	from payment 
	group by customer_id 
	having SUM(amount) > 175
	order by sum(amount) desc 
)

-- #4
select customer.first_name, customer.last_name, address.city_id, city.city, country
from customer 
full join address 
on address.address_id = customer.customer_id 
full join city 
on city.city_id = address.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal'

-- #5
select staff_id, COUNT(staff_id) as staff_id_count 
from payment
group by staff_id 
order by COUNT(staff_id)

-- #6
select rating, COUNT(rating) as movie_count
from film 
group by rating 
order by count(rating)

-- #7
select *
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 6.99
	order by sum(amount) DESC
)

-- #8
select COUNT(*) as free_rental_count
from payment 
where amount = 0