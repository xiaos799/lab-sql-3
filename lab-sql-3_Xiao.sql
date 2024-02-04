use sakila;

#How many distinct (different) actors' last names are there?
select * from actor;
select count(distinct last_name) from actor;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film;
select count(distinct language_id) from film;

#How many movies were released with "PG-13" rating?
select count(film_id) from film where rating = 'PG-13';

#Get 10 the longest movies from 2006
select * from film where release_year = 2006 order by length desc limit 10;

#How many days has been the company operating (check DATEDIFF() function)?
select * from rental;
select datediff(max(last_update), min(rental_date)) from rental;

#Show rental info with additional columns month and weekday. Get 20
select *, date_format(rental_date, "%M") as month, date_format(rental_date, "%W") as weekday from rental limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,
   case
     when date_format(rental_date, "%W") = 'Saturday' | 'Sunday' then 'weekend'
     else 'workday'
   end as day_type
  from rental;
  
  #How many rentals were in the last month of activity?
  select distinct date_format(rental_date, "%M") from rental;
  select count(rental_id) from rental where date_format(rental_date, "%M") = 'August';













