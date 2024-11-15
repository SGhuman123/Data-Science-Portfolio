-- I used PostgresSQL

-- Define positive and negative sentiment words
WITH sentiment_words AS (
  SELECT 'Positive' AS sentiment, unnest(string_to_array('excellent,loved,recommend,happy,friendly,clean,comfortable', ',')) AS word
  UNION ALL
  SELECT 'Negative' AS sentiment, unnest(string_to_array('disappointed,terrible,waste,broken,dirty,uncomfortable,rude', ',')) AS word
)

-- Main query to process reviews and calculate sentiment scores
SELECT 
  sentiment,
  COUNT(*) AS review_count,
  AVG(hb."Rating") AS average_rating
FROM "public"."hotel_reviews" hb
INNER JOIN sentiment_words sw ON hb."Review" ILIKE '%' || sw.word || '%'
GROUP BY sentiment;

