----What are the top 5 popular locations with the highest number of flight bookings made through SuperTravel?
SELECT * FROM
(SELECT dc.city_name, COUNT(fs.flight_reservation_id) AS number_of_bookings, RANK() OVER (ORDER BY COUNT(fs.flight_reservation_id) DESC) AS ranking 
FROM flight_segment AS fs
JOIN destination_cities AS dc ON (fs.city_arvl = dc.city_id)
GROUP BY city_name) as foo
WHERE ranking<=5

----What are the hotel bookings in the past n days and how much do each cost?
SELECT h.hotel_name, c.company_name, a.city_name as located_in,
(hr.check_out_date - hr.check_in_date)::integer AS days_of_stay,
((hr.check_out_date - hr.check_in_date)::integer + 1) * hr.price_per_night AS total_cost
FROM hotel_reservation hr
JOIN hotel_rooms hrms ON hr.room_id = hrms.room_id
JOIN hotels h ON hrms.hotel_id = h.hotel_id
JOIN companies c ON c.company_id = h.company_id
JOIN addresses a ON h.address_id=a.address_id
WHERE 
hr.check_in_date BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE;

-----What are the hotels ratings from high to low and what do people think of them？
WITH hotel_ratings AS (
SELECT hotel_id, AVG(rating) AS average_rating
FROM hotel_reviews
GROUP BY hotel_id),
ranked_hotels AS (SELECT hotel_id,average_rating, RANK() OVER (ORDER BY average_rating DESC) as rank
FROM hotel_ratings
),
top_hotels AS (SELECT hotel_id
FROM ranked_hotels
WHERE rank <= 5
)
SELECT h.hotel_name,hr.rating,hr.review_text
FROM hotels AS h
JOIN hotel_reviews AS hr ON (h.hotel_id = hr.hotel_id)
WHERE h.hotel_id IN (SELECT hotel_id FROM top_hotels)
ORDER BY hr.rating DESC;

 
 -------Which vehicle models are most frequently rented through SuperTravel?
select * from 
(SELECT v.manufacturer, v.model, v.type,
  COUNT(*) AS rental_count, RANK ()OVER (ORDER BY COUNT(*) DESC) as best_model_ranking
FROM 
  vehicle_reservation AS vr
  JOIN vehicles AS v ON (vr.vin_number = v.vin_number)
GROUP BY
  v.manufacturer, v.model, v.type) as foo
WHERE best_model_ranking<=6;
  
 
----How many users made reservations over SuperTravel in the last 90 days under each reservation type(car rental, hotel, flight)?

WITH car_rental_users AS 
(SELECT DISTINCT user_id
FROM vehicle_reservation
WHERE pick_up_time BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE
),
hotel_users AS (
SELECT DISTINCT user_id FROM hotel_reservation
WHERE check_in_date BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE
),
flight_users AS (SELECT DISTINCT user_id FROM flight_reservation AS fr
JOIN flight_segment AS fs ON (fr.flight_reservation_id = fs.flight_reservation_id)
WHERE
TO_DATE(fs.take_off_date, 'MM/DD/YYYY') BETWEEN CURRENT_DATE - INTERVAL '90 days' AND CURRENT_DATE
)
SELECT
'Car Rental' AS reservation_type, COUNT(*) AS user_count
FROM car_rental_users
UNION ALL
SELECT 'Hotel' AS reservation_type, COUNT(*) AS user_count
FROM
hotel_users
UNION ALL
SELECT 'Flight' AS reservation_type, COUNT(*) AS user_count
FROM flight_users;

 
 ----What is the average spending per booking for each type of reservation made through SuperTravel? 
WITH car_rental_avg AS (
SELECT ROUND(AVG(vr.price_per_hour * EXTRACT(hour FROM (vr.return_time - vr.pick_up_time))::numeric), 2) AS average_spending
FROM vehicle_reservation vr
),
hotel_avg AS (
SELECT ROUND(AVG((hr.price_per_night * (hr.check_out_date - hr.check_in_date+1))::numeric), 2) AS average_spending
FROM hotel_reservation hr
),
flight_avg AS (
SELECT ROUND(AVG((fr.price_per_ticket * fr.tickets_purchased)::numeric), 2) AS average_spending
FROM flight_reservation fr
)
SELECT 'Car Rental' AS reservation_type, average_spending
FROM car_rental_avg
UNION ALL
SELECT 'Hotel' AS reservation_type, average_spending
FROM hotel_avg
UNION ALL
SELECT 'Flight' AS reservation_type, average_spending
FROM flight_avg;

  
-----Who are the users who are most loyal to SuperTravel (made most number of bookings)?
select * from
(SELECT users.user_id, first_name, last_name, COUNT(*) as num_bookings, rank () over (order by(COUNT(*)) DESC) as ranking
FROM users
JOIN hotel_reservation ON users.user_id = hotel_reservation.user_id
JOIN vehicle_reservation ON users.user_id = vehicle_reservation.user_id
JOIN flight_reservation ON users.user_id = flight_reservation.user_id
GROUP BY users.user_id
ORDER BY num_bookings DESC) as foo
where ranking<=10;

-----What are the cancelled transcation's information?
SELECT t.transaction_id, hr.*, vr.*, fr.*
FROM transaction t
LEFT JOIN vehicle_reservation vr ON t.vehicle_reservation_id = vr.vehicle_reservation_id
LEFT JOIN flight_reservation fr ON t.flight_reservation_id = fr.flight_reservation_id
LEFT JOIN hotel_reservation hr ON t.hotel_reservation_id = hr.hotel_reservation_id
WHERE t.cancelled = 1
ORDER BY t.transaction_id ASC;

-----------9-----------------------
WITH age_groups AS 
(SELECT user_id,EXTRACT(YEAR FROM AGE(CURRENT_DATE, dob))::INTEGER AS age
FROM users
),
reservations AS (
SELECT user_id, COUNT(*) AS num_reservations
FROM (SELECT user_id FROM hotel_reservation
    UNION ALL
    SELECT user_id FROM vehicle_reservation
    UNION ALL
    SELECT user_id FROM flight_reservation
  ) AS all_reservations
GROUP BY user_id
),
age_group_reservations AS (
SELECT CASE
WHEN age BETWEEN 20 AND 29 THEN '20-29'
WHEN age BETWEEN 30 AND 39 THEN '30-39'
WHEN age BETWEEN 40 AND 49 THEN '40-49'
WHEN age BETWEEN 50 AND 59 THEN '50-59'
WHEN age BETWEEN 60 AND 69 THEN '60-69'
ELSE '70+'
END AS age_group,
SUM(r.num_reservations) AS num_reservations
FROM age_groups ag
JOIN reservations r ON ag.user_id = r.user_id
GROUP BY age_group
)
SELECT age_group, num_reservations
FROM age_group_reservations
ORDER BY num_reservations DESC;

  
-----Which users have made three reservations at the same time? The one with the highest total amount is sorted from low to high.

WITH simultaneous_reservations AS (
SELECT t.user_id, ROUND(SUM(
      COALESCE(hr.price_per_night * (hr.check_out_date - hr.check_in_date+1), 0) +
      COALESCE(vr.price_per_hour * EXTRACT(hour FROM (vr.return_time - vr.pick_up_time)), 0) +
      COALESCE(fr.price_per_ticket * fr.tickets_purchased, 0)
    ))::NUMERIC(10, 2) AS total_amount,
    COUNT(*) AS num_reservations
FROM transaction t
  LEFT JOIN hotel_reservation hr ON t.hotel_reservation_id = hr.hotel_reservation_id
  LEFT JOIN vehicle_reservation vr ON t.vehicle_reservation_id = vr.vehicle_reservation_id
  LEFT JOIN flight_reservation fr ON t.flight_reservation_id = fr.flight_reservation_id
WHERE t.cancelled = 0
GROUP BY t.user_id
HAVING COUNT(*) = 3
),
users_with_reservations AS (
  SELECT
    sr.user_id,
    u.first_name,
    u.last_name,
    sr.total_amount
  FROM
    simultaneous_reservations sr
  JOIN
    users u ON sr.user_id = u.user_id
)

SELECT
  user_id,
  first_name,
  last_name,
  total_amount
FROM
  users_with_reservations
ORDER BY
  total_amount DESC;
  



