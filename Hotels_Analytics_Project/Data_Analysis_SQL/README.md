# Description of SQL Task Done

## Question 1: 
*Identify the busiest and least busy year and month for each hotel along with the corresponding number of guests during those periods. Please justify how room occupancy per month is computed to justify the logic.*
> * Candidates are allowed to make more assumptions, but assumptions must be stated.
> i)Assumption: reservation status = "Check-Out" indicates that the room was occupied.

## Question 2:
*Provide a report on the hotel guests’ stay duration by finding the average duration of stay over the weekend, weekdays and overall average duration of stay for hotel guests for each hotel.*

## Question 3:
*The hotel's branch Chief Data Officer has requested a market basket analysis of the market segments. By identifying the number of uses of each hotel amenity, what are the most booked set of amenities or services for each hotel?*

## Question 4:
*The hotel's branch Chief Data Officer would like to distinguish heavy users and light users of the existing amenities. If the total number of booked amenities or services for a guest is greater than or equal to 3, their category will be set as "Heavy User"; otherwise, it will be designated as "Light User". Candidates are to modify the table and add extra column(s) derived from the existing columns in the table.*

## Question 5:
*The hotel's branch Chief Data Officer would like to get a general sense of the reviews and ratings. Please provide the count of reviews and the average rating value based on keywords related to positive and negative sentiments in the reviews.*
> * We shall use any reasonable words to filter good and bad words.
Filtered words must be clearly stated.

> **Notes:**
> Before loading the dataset `hotel_bookings.csv` into Postgres, I noticed that there were 4 NA values in the children column which was causing loading difficulties. As such, I cleaned the CSV using Excel manually and created a new CSV file called `hotel_bookings_2.csv`.
