-- I used PostgresSQL

-- MHG’s CDO would like to distinguish heavy users and light users of the existing
-- amenities. If the total number of booked amenities or services for a guest is greater
-- than or equal to 3, their category will be set as "Heavy User"; otherwise, it will be
-- designated as "Light User". Candidates are to modify the table and add extra
-- column(s) derived from the existing columns in the table.

-- Delete the user_category column
ALTER TABLE hotel_bookings
DROP COLUMN user_category;


-- Add a new column to store user category
ALTER TABLE hotel_bookings
ADD COLUMN user_category VARCHAR(20);

-- Update the new column based on total amenity usage
UPDATE hotel_bookings
SET user_category = CASE
    WHEN (CASE WHEN exercise_use THEN 1 ELSE 0 END
          + CASE WHEN work_use THEN 1 ELSE 0 END
          + CASE WHEN breakfast_use THEN 1 ELSE 0 END
          + CASE WHEN spa_use THEN 1 ELSE 0 END
          + CASE WHEN tourism_use THEN 1 ELSE 0 END) >= 3 THEN 'Heavy User'
    ELSE 'Light User'
    END;
    
SELECT * FROM hotel_bookings
 
