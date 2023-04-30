select* from companies
select* from addresses
select* from destination_cities
select* from hotel_reviews
select* from hotel_reservation
select* from hotel_rooms
select* from hotels
select* from users
select* from vehicles
select* from vehicle_reservation
select* from flight_reservation
select* from flight_segment
select* from airplanes
select* from flight_passenger
select* from transaction

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  gender VARCHAR(30),
  dob DATE,
  email VARCHAR(255),
  phone_number VARCHAR(15),
  credit_card CHAR(20),
  address_id VARCHAR(255)
);

CREATE TABLE addresses (
  address_id VARCHAR(255) PRIMARY KEY,
  address_line1 VARCHAR(255),
  address_line2 VARCHAR(255),
  city_name VARCHAR(255),
  state VARCHAR(255),
  country VARCHAR(255),
  zipcode VARCHAR(10)
);

CREATE TABLE hotels (
  hotel_id SERIAL PRIMARY KEY,
  hotel_name VARCHAR(255),
  company_id INTEGER,
  address_id VARCHAR(255)
);

CREATE TABLE companies (
  company_id SERIAL PRIMARY KEY,
  type VARCHAR(20) CHECK (Type IN ('hotel', 'car rental', 'airline')),
  company_name VARCHAR(100),
  membership_status VARCHAR(50),
  description_text VARCHAR(255)
);

CREATE TABLE vehicles (
  vin_number VARCHAR(255) PRIMARY KEY,
  plate_number VARCHAR(50),
  company_id INTEGER,
  manufacturer VARCHAR(255),
  model VARCHAR(255),
  type varchar(50),
  vehicle_year INTEGER
  
);

CREATE TABLE airplanes (
  airplane_id SERIAL PRIMARY KEY,
  aircraft_type VARCHAR(255),
  manufacturer VARCHAR(255),
  model VARCHAR(255),
  number_of_seats INTEGER,
  company_id INTEGER
);

CREATE TABLE hotel_rooms (
  room_id  INT,
  hotel_id INTEGER,
  room_number INTEGER,
  room_type VARCHAR(255),
  PRIMARY KEY (room_id)
);

CREATE TABLE hotel_reservation (
  hotel_reservation_id SERIAL PRIMARY KEY,
  user_id INTEGER,
  room_id INTEGER,
  check_in_date DATE,
  check_out_date DATE,
  price_per_night NUMERIC(10, 2)
);

CREATE TABLE vehicle_reservation (
  vehicle_reservation_id SERIAL PRIMARY KEY,
  vin_number VARCHAR(255),
  user_id INTEGER,
  pick_up_time TIMESTAMP,
  return_time TIMESTAMP,
  pick_up_location VARCHAR(255),
  return_location VARCHAR(255),
  price_per_hour NUMERIC(10, 2)
);

CREATE TABLE destination_cities (
  city_id CHAR(3) PRIMARY KEY,
  city_name VARCHAR(255)
);

CREATE TABLE hotel_reviews (
  hotel_id INTEGER,
  user_id INTEGER,
  review_date DATE,
  review_text TEXT,
  rating INTEGER,
  PRIMARY KEY (hotel_id, user_id, review_date)
);

CREATE TABLE flight_reservation (
  flight_reservation_id INT PRIMARY KEY,
  user_id INTEGER,
  price_per_ticket  NUMERIC(10,2),
  tickets_purchased INT
);

CREATE TABLE transaction (
  transaction_id SERIAL PRIMARY KEY,
  hotel_reservation_id INTEGER,
  vehicle_reservation_id INTEGER,
  flight_reservation_id INTEGER,
  user_id INTEGER,
  payment VARCHAR(20),
  transaction_date DATE,
  cancelled BOOLEAN
);

CREATE TABLE flight_passenger (
  flight_reservation_id INTEGER,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  identity_number VARCHAR(20),
  PRIMARY KEY (flight_reservation_id, first_name, last_name)
);

CREATE TABLE flight_segment (
  flight_reservation_id INTEGER,
  flight_number VARCHAR(10),
  city_dept CHAR(3),
  city_arvl CHAR(3),
  airplane_id INTEGER,
  take_off_date date,
  flight_time numeric(4,2),
  seat_type VARCHAR(20) CHECK (seat_type IN ('firstClass', 'premium', 'economic')),
  PRIMARY KEY (flight_reservation_id, flight_number)
);

-- Alter tables to enable relationships
ALTER TABLE users
  ADD FOREIGN KEY (address_id) REFERENCES addresses(address_id);
  
ALTER TABLE destination_cities
ADD CONSTRAINT unique_city_name UNIQUE (city_name);

ALTER TABLE hotels
  ADD FOREIGN KEY (company_id) REFERENCES companies(company_id),
  ADD FOREIGN KEY (address_id) REFERENCES addresses(address_id);

ALTER TABLE vehicles
  ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

ALTER TABLE airplanes
  ADD FOREIGN KEY (company_id) REFERENCES companies(company_id);

ALTER TABLE hotel_rooms
  ADD FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id);

ALTER TABLE hotel_reservation
  ADD FOREIGN KEY (user_id) REFERENCES users(user_id),
  ADD FOREIGN KEY (room_id) REFERENCES hotel_rooms(room_id),
  ADD CONSTRAINT unique_date_h UNIQUE (user_id, room_id, check_in_date);

ALTER TABLE vehicle_reservation
  ADD FOREIGN KEY (vin_number) REFERENCES vehicles(vin_number),
  ADD FOREIGN KEY (user_id) REFERENCES users(user_id),
  ADD FOREIGN KEY (pick_up_location) REFERENCES destination_cities(city_name),
  ADD FOREIGN KEY (return_location) REFERENCES destination_cities(city_name),
  ADD CONSTRAINT unique_date_v UNIQUE (user_id, vin_number, pick_up_time);
 
ALTER TABLE hotel_reviews
  ADD FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),
  ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE flight_reservation
  ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE transaction
  ADD FOREIGN KEY (hotel_reservation_id) REFERENCES hotel_reservation(hotel_reservation_id),
  ADD FOREIGN KEY (vehicle_reservation_id) REFERENCES vehicle_reservation(vehicle_reservation_id),
  ADD FOREIGN KEY (flight_reservation_id) REFERENCES flight_reservation(flight_reservation_id),
  ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE flight_passenger
  ADD FOREIGN KEY (flight_reservation_id) REFERENCES flight_reservation(flight_reservation_id);

ALTER TABLE flight_segment
  ADD FOREIGN KEY (flight_reservation_id) REFERENCES flight_reservation(flight_reservation_id),
  ADD FOREIGN KEY (city_dept) REFERENCES destination_cities(city_id),
  ADD FOREIGN KEY (city_arvl) REFERENCES destination_cities(city_id);
  
  
  
   

