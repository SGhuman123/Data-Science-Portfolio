-- I used PostgresSQL

-- a market basket analysis of the market segments. By identifying the number of uses of each hotel amenity, 
-- what are the most booked set of amenities or services for each hotel?

-- Assumptions:
-- -	The number of guests per room (adults, children, baby) remain constant throughout the duration of the stay
-- -	Given the table schema states that 1 indicates that guest has used the facility whereas 0 indicates that guest has not used the particular facility, I assumed that the number of times a guest uses the facility throughout their duration of their stay is only 1 time.
-- -	Another assumption is that when a guest uses the facility, everyone booked under the same guest_details which consist of adults, children and babies use the facilities 
-- -	Number of bookings for exercise of a particular hotel = summation[exercise_use of a specific guest from a particular hotel* (adults + children + baby))
-- -	Number of bookings for work of a particular hotel = summation[work_use of a specific guest from a particular hotel* (adults + children + baby))
-- -	Number of bookings for breakfast of a particular hotel = summation[breakfast_use of a specific guest from a particular hotel* (adults + children + baby))
-- -	Number of bookings for spa of a particular hotel = summation[spa_use of a specific guest from a particular hotel* (adults + children + baby))
-- -	Number of bookings for tourism of a particular hotel = summation[tourism_use of a specific guest from a particular hotel* (adults + children + baby))

SELECT
    hotel,
    SUM(CASE WHEN exercise_use THEN adults + children + babies ELSE 0 END) AS exercise_count,
    SUM(CASE WHEN work_use THEN adults + children + babies ELSE 0 END) AS work_count,
    SUM(CASE WHEN breakfast_use THEN adults + children + babies ELSE 0 END) AS breakfast_count,
    SUM(CASE WHEN spa_use THEN adults + children + babies ELSE 0 END) AS spa_count,
    SUM(CASE WHEN tourism_use THEN adults + children + babies ELSE 0 END) AS tourism_count
FROM hotel_bookings
GROUP BY hotel;

