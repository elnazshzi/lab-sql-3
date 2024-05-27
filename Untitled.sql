-- 1
select count( distinct last_name) from sakila.actor;


-- 2
select count(distinct language_id) from sakila.film;


-- 3
select count(rating) from sakila.film 
where rating = 'PG-13';


-- 4
select title , length ,release_year from sakila.film
where release_year = 2006
order by length desc
limit 10;


-- 5
select datediff(now(), min(rental_date)) from sakila.rental;


-- 6
select rental_id, rental_date, inventory_id, 
customer_id, return_date, staff_id, last_update, rental_date,
month(rental_date) as month, 
dayofweek(rental_date) as week_day
from sakila.rental
limit 20 ;


-- 7
select rental_id, rental_date, inventory_id, 
customer_id, return_date, staff_id, last_update, rental_date,
month(rental_date) as month, 
dayofweek(rental_date) as week_day, 
 case 
  when dayofweek(rental_date)= 1 then "weekend"
  when dayofweek(rental_date)= 7 then "weekend"
  else "workday"
  end as day_type
from sakila.rental;



-- 8
select count(*) from sakila.rental
where rental_date>now() - interval 1 month;



select count(rental_id)
from sakila.rental
where month(rental_date) = month((select max(rental_date) from sakila.rental))
and year(rental_date) = year((select max(rental_date) from sakila.rental));








