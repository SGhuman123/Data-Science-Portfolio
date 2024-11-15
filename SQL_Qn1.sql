-- I used PostgresSQL

-- Identify the busiest and least busy year and month for each hotel along with the
-- corresponding number of guests during those periods. Please justify how room
-- occupancy per month is computed to justify the logic.

-- This was done in order to sort based on months

-- ALTER TABLE "public"."hotel_bookings" ADD COLUMN month_int INTEGER;
-- 
-- Update the new column with the month number
-- UPDATE "public"."hotel_bookings"
-- SET month_int = EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')); 
 
 -- Iteration 1: The simple solution where we only consider the room occupancy per month
 -- based on adults, children, babies upon arrival
 
-- I assume The number of guests per room (adults, children, baby) remain constant throughout the duration of the stay
 
-- SELECT
--   hotel,
--   arrival_date_year,
--   arrival_date_month,
--   SUM(adults + children + babies) AS total_guests
-- FROM "public"."hotel_bookings"
-- GROUP BY hotel, arrival_date_year, arrival_date_month, month_int
-- ORDER BY hotel, arrival_date_year, month_int;

-- The simple solution tells us that for Bard 2018 September is the busiest month
-- The simple solution tells us that for Bard 2019 August is the busiest month
-- The simple solution tells us that for Bard 2020 February is the busiest month
-- However, we do not clearly know which year is the busiest

-- SELECT
--   hotel,
--   arrival_date_year,
  -- Total guests for each year
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 1 THEN adults + children + babies ELSE 0 END) AS january_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 2 THEN adults + children + babies ELSE 0 END) AS february_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 3 THEN adults + children + babies ELSE 0 END) AS march_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 4 THEN adults + children + babies ELSE 0 END) AS april_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 5 THEN adults + children + babies ELSE 0 END) AS may_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 6 THEN adults + children + babies ELSE 0 END) AS june_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 7 THEN adults + children + babies ELSE 0 END) AS july_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 8 THEN adults + children + babies ELSE 0 END) AS august_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 9 THEN adults + children + babies ELSE 0 END) AS september_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 10 THEN adults + children + babies ELSE 0 END) AS october_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 11 THEN adults + children + babies ELSE 0 END) AS november_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 12 THEN adults + children + babies ELSE 0 END) AS december_guests,
  -- Total guests for each year
--   SUM(adults + children + babies) AS total_guests_per_year
-- FROM "public"."hotel_bookings"
-- GROUP BY hotel, arrival_date_year
-- ORDER BY hotel, arrival_date_year;

-- From here we can now observe that the busiest year for Bard was in 2019 whereas the busiest year for Bloom was in 2019.
-- However, this fails to consider the fact that the calculation only takes into account the number of guest upon arrival
-- and fails to take into account the fact that guest tend to stay at hotels overnight

-- SELECT
--   hotel,
--   arrival_date_year,
-- Total guests for each month
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 1 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS january_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 2 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS february_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 3 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS march_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 4 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS april_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 5 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS may_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 6 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS june_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 7 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS july_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 8 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS august_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 9 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS september_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 10 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS october_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 11 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS november_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 12 THEN (adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights) ELSE 0 END) AS december_guests,
--   Total guests for each year
--   SUM((adults + children + babies) * (1 + stays_in_weekend_nights + stays_in_week_nights)) AS total_guests_per_year
-- FROM "public"."hotel_bookings"
-- GROUP BY hotel, arrival_date_year
-- ORDER BY hotel, arrival_date_year;

-- This more accurately shows the number of guest per month in any given year. However, this data is an overestimation
-- eg: Imagine I check in on say 29 August and I stay for a period of 7 days, the calculation would be captured under August even though some of the days I stayed over
-- should be recorded in September resulting in an overestimation
-- To get a closer estimate of the days I did stay in August,
-- I assume that each and every month has 31 days

-- Thus,
-- Nights_from_stays_in_this_month = stays_in_weekend_nights + stays_in_week_nights - IF(arrival_date_month + stays_in_weekend_nights + stays_in_week_nights <= 31 then = 0, ELSE arrival_date_month + stays_in_weekend_nights + stays_in_week_nights - 31)

-- SELECT
--   hotel,
--   arrival_date_year,
--   Total guests for each month
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 1 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS january_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 2 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS february_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 3 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS march_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 4 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS april_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 5 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS may_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 6 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS june_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 7 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS july_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 8 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS august_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 9 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS september_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 10 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1 
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS october_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 11 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS november_guests,
--   SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 12 THEN
--           (adults + children + babies) * 
--           (
--             CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
--                  THEN stays_in_weekend_nights + stays_in_week_nights + 1
--                  ELSE 31 - arrival_date_day_of_month + 1 
--             END
--           )
--        ELSE 0 END) AS december_guests
-- FROM "public"."hotel_bookings"
-- GROUP BY hotel, arrival_date_year
-- ORDER BY hotel, arrival_date_year;

-- This presents a more accurate depiction closer to the true value of the number of guest per month in any given year
-- However, we still want to find the total number of guest throughout all days in the year to the most accurate estimate
-- Thus to do so, we consider when EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) != 12 then stays_in_weekend_nights + stays_in_week_nights + 1, elif when EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 12 and arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 then stays_in_weekend_nights + stays_in_week_nights + 1 else 31 - arrival_date_day_of_month + 1 


SELECT
  hotel,
  arrival_date_year,
--   Total guests for each month
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 1 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS january_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 2 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS february_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 3 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS march_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 4 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS april_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 5 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS may_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 6 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS june_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 7 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS july_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 8 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS august_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 9 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS september_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 10 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1 
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS october_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 11 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS november_guests,
  SUM(CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) = 12 THEN
          (adults + children + babies) * 
          (
            CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31 
                 THEN stays_in_weekend_nights + stays_in_week_nights + 1
                 ELSE 31 - arrival_date_day_of_month + 1 
            END
          )
       ELSE 0 END) AS december_guests,
  -- Total guests for each year
  SUM((adults + children + babies) *
      (
        CASE WHEN EXTRACT(MONTH FROM TO_DATE(arrival_date_month, 'Month')) != 12
             THEN stays_in_weekend_nights + stays_in_week_nights + 1
             ELSE
               CASE WHEN arrival_date_day_of_month + stays_in_weekend_nights + stays_in_week_nights <= 31
                    THEN stays_in_weekend_nights + stays_in_week_nights + 1
                    ELSE 31 - arrival_date_day_of_month + 1
               END
        END
      )
     ) AS total_guests_per_year
FROM "public"."hotel_bookings"
GROUP BY hotel, arrival_date_year
ORDER BY hotel, arrival_date_year;

-- This is perhaps the closest estimate to the true value for the any month in a given year
-- as well as any year overall.
-- However, it is worth noting that the values here are likely an underestimation of the true values of the sum of guest 
-- the hotel accomodates in a time horizon of a year or a month.
-- This is because for example if I check in on 28 August and stay for a period of 7 days, in this example assuming August has 31 days
-- then the remaining 4 days should be captured in September but it is not.
-- Therefore this leads to the next assumption that is
-- The spillover days would be insignificant in comparison the the days which are actually capture in a given time horizon be it a month or a year.

-- Overall for Bard Hotel its busiest year is in 2019 with August as its busiest month
-- Overall for Bloom Hotel its busiest year is in 2019 with August as its busiest month








