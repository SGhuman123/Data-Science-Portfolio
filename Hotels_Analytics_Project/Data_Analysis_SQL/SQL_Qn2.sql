-- I used PostgresSQL

-- Question 2: Provide a report on the hotel guests’ stay duration by finding the average duration of stay over the weekend, 
-- weekdays and overall average duration of stay for hotel guests for each hotel in PostgresSQL.

-- Assumptions:
-- -	The number of guests per room (adults, children, baby) remain constant throughout the duration of the stay
-- -	Average duration over the weekend of a particular hotel = (sum of all adults from a particular hotel + sum of all children from a particular hotel)/total number of days over a weekend from a particular hotel
-- -	Average duration over the week nights of a particular hotel = (sum of all adults from a particular hotel + sum of all children from a particular hotel)/total number of days over a week nights from a particular hotel
-- -	Average overall duration of stay at a particular hotel = (sum of all adults from a particular hotel + sum of all children from a particular hotel)/(total number of days over a week nights from a particular hotel + total number of days over a weekend from a particular hotel)
-- 

SELECT
    hotel,
    ROUND(CAST(SUM((stays_in_weekend_nights + stays_in_week_nights) * (adults + children + babies)) AS NUMERIC) / SUM(adults + children + babies), 2) AS overall_avg_duration,
    ROUND(CAST(SUM(stays_in_weekend_nights * (adults + children + babies)) AS NUMERIC) / SUM(adults + children + babies), 2) AS avg_weekend_duration,
    ROUND(CAST(SUM(stays_in_week_nights * (adults + children + babies)) AS NUMERIC) / SUM(adults + children + babies), 2) AS avg_weekday_duration
FROM
    hotel_bookings
GROUP BY
    hotel;











