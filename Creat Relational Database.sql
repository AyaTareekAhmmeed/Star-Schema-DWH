--Creat Relational Database

CREATE TABLE category (
    category_id INT PRIMARY KEY,
    name VARCHAR(255),
    last_update TIMESTAMP
);

-- Inserting data into the "category" table
INSERT INTO category (category_id, name, last_update)
VALUES
    (1, 'Electronics', '2023-10-31 08:00:00'),
    (2, 'Clothing', '2023-10-30 14:30:00'),
    (3, 'Books', '2023-10-29 10:15:00'),
    (4, 'Home & Garden', '2023-10-28 16:45:00');
	
SELECT *
FROM category


CREATE TABLE film_category (
    film_id INT PRIMARY KEY,
    category_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Inserting data into the "film_category" table
INSERT INTO film_category (film_id, category_id, last_update)
VALUES
    (101, 1, '2023-10-31 08:30:00'),
    (102, 2, '2023-10-30 15:00:00'),
    (103, 3, '2023-10-29 11:00:00'),
    (104, 1, '2023-10-28 17:30:00');
	
SELECT *
FROM film_category


CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    release_year INT,
    language_id INT,
    rental_duration INT,
    rental_rate DECIMAL(4, 2),
    length INT,
    replacement_cost DECIMAL(5, 2),
    rating VARCHAR(5),
    last_update TIMESTAMP,
    special_features VARCHAR(255),
    fulltext TEXT
);

ALTER TABLE film 
ADD CONSTRAINT language_id
FOREIGN KEY (language_id) REFERENCES language(language_id);


-- Inserting data into the "film" table
INSERT INTO film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update, special_features, fulltext)
VALUES
    (1, 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years...', 1994, 1, 5, 2.99, 142, 19.99, 'R', '2023-10-31 12:00:00', 'Trailers, Commentaries', 'Two imprisoned men bond over a number of years...'),
    (2, 'The Godfather', 'The aging patriarch of an organized crime dynasty...', 1972, 1, 5, 2.99, 175, 19.99, 'R', '2023-10-30 14:00:00', 'Trailers, Commentaries', 'The aging patriarch of an organized crime dynasty...'),
    (3, 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster...', 1994, 1, 5, 2.99, 154, 19.99, 'R', '2023-10-29 10:30:00', 'Trailers, Commentaries', 'The lives of two mob hitmen, a boxer, a gangster...'),
    (4, 'The Dark Knight', 'When the menace known as The Joker emerges from...', 2008, 1, 5, 2.99, 152, 19.99, 'PG-13', '2023-10-28 16:30:00', 'Trailers, Commentaries', 'When the menace known as The Joker emerges from...');
	
	
SELECT *
FROM film


CREATE TABLE language (
    language_id INT PRIMARY KEY,
    name VARCHAR(50),
    last_update TIMESTAMP
);

-- Inserting data into the "language" table
INSERT INTO language (language_id, name, last_update)
VALUES
    (1, 'English', '2023-10-31 08:00:00'),
    (2, 'Spanish', '2023-10-30 14:30:00'),
    (3, 'French', '2023-10-29 10:15:00'),
    (4, 'German', '2023-10-28 16:45:00');
	
SELECT *
FROM language


CREATE TABLE film_actor (
    actor_id INT PRIMARY KEY,
    film_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- Inserting data into the "film_actor" table
INSERT INTO film_actor (actor_id, film_id, last_update)
VALUES
    (1, 1, '2023-10-31 08:30:00'),
    (2, 2, '2023-10-30 14:00:00'),
    (3, 3, '2023-10-29 10:30:00'),
    (4, 4, '2023-10-28 16:30:00');
	
SELECT *
FROM film_actor

CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country VARCHAR(50),
    last_update TIMESTAMP
);


-- Inserting data into the "country" table
INSERT INTO country (country_id, country, last_update)
VALUES
    (1, 'United States', '2023-10-31 08:00:00'),
    (2, 'Canada', '2023-10-30 14:30:00'),
    (3, 'United Kingdom', '2023-10-29 10:15:00'),
    (4, 'Australia', '2023-10-28 16:45:00');
	
SELECT *
FROM country

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city VARCHAR(50),
    country_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Inserting data into the "city" table
INSERT INTO city (city_id, city, country_id, last_update)
VALUES
    (1, 'New York', 1, '2023-10-31 08:30:00'),
    (2, 'Los Angeles', 1, '2023-10-30 14:00:00'),
    (3, 'Toronto', 2, '2023-10-29 10:30:00'),
    (4, 'London', 3, '2023-10-28 16:30:00');

SELECT *
FROM city

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    address VARCHAR(50),
    address2 VARCHAR(50),
    district VARCHAR(50),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    last_update TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- Inserting data into the "address" table
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone, last_update)
VALUES
    (1, '123 Main Street', 'Apt 4B', 'Downtown', 1, '12345', '555-123-4567', '2023-10-31 08:45:00'),
    (2, '456 Elm Avenue', NULL, 'Suburbia', 2, '67890', '555-987-6543', '2023-10-30 14:15:00'),
    (3, '789 Oak Road', 'Unit 7C', 'Midtown', 3, '54321', '555-765-4321', '2023-10-29 10:45:00'),
    (4, '101 Pine Lane', NULL, 'Rural', 4, '98765', '555-321-6789', '2023-10-28 16:15:00');

SELECT *
FROM address


CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    store_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50),
    address_id INT,
    activebool BOOLEAN,
    create_date TIMESTAMP,
    last_update TIMESTAMP,
    active INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Inserting data into the "customer" table
INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES
    (1, 1, 'John', 'Doe', 'john@example.com', 1, TRUE, '2023-10-31 08:00:00', '2023-10-31 08:00:00', 1),
    (2, 2, 'Jane', 'Smith', 'jane@example.com', 2, TRUE, '2023-10-30 14:30:00', '2023-10-30 14:30:00', 1),
    (3, 1, 'Robert', 'Johnson', 'robert@example.com', 3, TRUE, '2023-10-29 10:15:00', '2023-10-29 10:15:00', 1),
    (4, 2, 'Emily', 'Williams', 'emily@example.com', 4, TRUE, '2023-10-28 16:45:00', '2023-10-28 16:45:00', 1);

SELECT *
FROM customer

CREATE TABLE actor (
    actor_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    last_update TIMESTAMP
);


-- Inserting data into the "actor" table
INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES
    (1, 'Tom', 'Hanks', '2023-10-31 08:00:00'),
    (2, 'Meryl', 'Streep', '2023-10-30 14:30:00'),
    (3, 'Brad', 'Pitt', '2023-10-29 10:15:00'),
    (4, 'Angelina', 'Jolie', '2023-10-28 16:45:00');
	
SELECT *
FROM actor

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    address_id INT,
    email VARCHAR(50),
    store_id INT,
    active BOOLEAN,
    username VARCHAR(16),
    password VARCHAR(40),
    last_update TIMESTAMP,
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Inserting data into the "staff" table
INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
VALUES
    (1, 'John', 'Smith', 1, 'john@example.com', 1, TRUE, 'johnsmith', 'password123', '2023-10-31 08:00:00'),
    (2, 'Sarah', 'Johnson', 2, 'sarah@example.com', 2, TRUE, 'sarahjohnson', 'pass456', '2023-10-30 14:30:00');

SELECT *
FROM staff

CREATE TABLE rental (
    rental_id INT PRIMARY KEY,
    rental_date TIMESTAMP,
    inventory_id INT,
    customer_id INT,
    return_date TIMESTAMP,
    staff_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- Inserting data into the "rental" table
INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES
    (1, '2023-10-31 08:00:00', 1, 1, '2023-10-31 16:00:00', 1, '2023-10-31 08:00:00'),
    (2, '2023-10-30 14:30:00', 2, 2, '2023-10-30 21:00:00', 2, '2023-10-30 14:30:00'),
    (3, '2023-10-29 10:15:00', 3, 3, '2023-10-29 17:45:00', 1, '2023-10-29 10:15:00'),
    (4, '2023-10-28 16:45:00', 4, 4, '2023-10-28 23:15:00', 2, '2023-10-28 16:45:00');

SELECT *
FROM rental

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    rental_id INT,
    amount DECIMAL(5, 2),
    payment_date TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
);

-- Inserting data into the "payment" table
INSERT INTO payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date)
VALUES
    (1, 1, 1, 1, 5.99, '2023-10-31 08:00:00'),
    (2, 2, 2, 2, 4.99, '2023-10-30 14:30:00'),
    (3, 3, 1, 3, 6.99, '2023-10-29 10:15:00'),
    (4, 4, 2, 4, 7.99, '2023-10-28 16:45:00');

SELECT *
FROM payment

CREATE TABLE store (
    store_id INT PRIMARY KEY,
    manager_staff_id INT,
    address_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Inserting data into the "store" table
INSERT INTO store (store_id, manager_staff_id, address_id, last_update)
VALUES
    (1, 1, 1, '2023-10-31 08:00:00'),
    (2, 2, 2, '2023-10-30 14:30:00');

SELECT *
FROM store


CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    film_id INT,
    store_id INT,
    last_update TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- Inserting data into the "inventory" table
INSERT INTO inventory (inventory_id, film_id, store_id, last_update)
VALUES
    (1, 1, 1, '2023-10-31 08:00:00'),
    (2, 2, 1, '2023-10-30 14:30:00'),
    (3, 3, 2, '2023-10-29 10:15:00'),
    (4, 4, 2, '2023-10-28 16:45:00');
	
	
SELECT *
FROM inventory
