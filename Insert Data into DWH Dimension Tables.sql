INSERT INTO dimDate
(date_key,date, year, quarter, month, day, week, is_weekend)
SELECT
DISTINCT (TO_CHAR (payment_date :: DATE, 'yyyMMDD')::integer) as date_key,
date (payment_date) as date,
EXTRACT (year from payment_date) as year,
EXTRACT (quarter FROM payment_date)  as quarter,
EXTRACT (month FROM payment_date)    as month,
EXTRACT (day FROM payment_date)		 as day,
EXTRACT (week FROM payment_date)	 as week,
CASE WHEN EXTRACT (ISODOW FROM payment_date) IN (6, 7) THEN true ELSE false END as is_weekend 
FROM payment;

SELECT *
FROM dimDate


INSERT INTO dimCustomer (customer_key, customer_id, first_name, last_name, email, address, address2, district, city, country, postal_code, phone, active ,create_date, start_date, end_date)
SELECT
c.customer_id as customer_key,
c.customer_id,
c.first_name,
c.last_name,
c.email,
a.address,
a.address2,
a.district,
ci.city,
co.country,
postal_code,
a.phone,
c.active,
c.create_date,

now() AS start_date,
now() AS end_date

FROM customer c
JOIN address a ON (c.address_id = a.address_id)
JOIN city ci ON (a.city_id = ci.city_id)
JOIN country co ON (ci.country_id = co.country_id);

SELECT *
FROM dimCustomer


INSERT INTO dimMovie (movie_key, film_id, title, description, release_year, language, rating, rental_duration, length, special_features)
SELECT
    f.film_id as movie_key,
    f.film_id,
    f.title,
    f.description,
    f.release_year,
    l.name as language,
    f.rating,
    COALESCE(f.rental_duration, 0),  -- Assuming 0 is the default value
    f.length,
    f.special_features
FROM film f
JOIN language l ON (f.language_id = l.language_id);

SELECT *
FROM dimMovie

INSERT INTO dimStore (store_key, store_id, address, address2, district, city, country, postal_code, manager_first_name, manager_last_name, start_date, end_date)
SELECT 
    s.store_id as store_key,
    s.store_id,
    a.address,
    a.address2,
    a.district,
    ci.city,
    co.country,
    a.postal_code,
    st.first_name as manager_first_name,
    st.last_name as manager_last_name,
	s.last_update as start_date,
    NOW() as end_date   -- Assuming you want to use the current date and time as the end date
FROM store s
JOIN address a ON (s.address_id = a.address_id)
JOIN city ci ON (a.city_id = ci.city_id)
JOIN staff st ON (a.address_id = st.address_id)
JOIN country co ON (ci.country_id = co.country_id);

SELECT *
FROM dimStore