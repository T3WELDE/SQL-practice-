-- Day 4: Subqueries and CTEs

-- Groups with more than 10 songs: subquery version
SELECT *
FROM (
    SELECT group_name, COUNT(*) AS songs
    FROM tutorial.billboard_top_100_year_end
    GROUP BY group_name
) AS sub
WHERE songs > 10;

-- Same thing as a CTE
WITH sub AS (
    SELECT group_name, COUNT(*) AS songs
    FROM tutorial.billboard_top_100_year_end
    GROUP BY group_name
)
SELECT *
FROM sub
WHERE songs > 10
ORDER BY songs DESC;

-- Years with more than 100 songs
WITH sub AS (
    SELECT year, COUNT(*) AS songs
    FROM tutorial.billboard_top_100_year_end
    GROUP BY year
)
SELECT *
FROM sub
WHERE songs > 100;

-- DataLemur: Histogram of Tweets
-- Count tweets per user in 2022, then count how many users have each count.
SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM (
    SELECT user_id, COUNT(tweet_id) AS tweet_bucket
    FROM tweets
    WHERE tweet_date >= '2022-01-01' AND tweet_date < '2023-01-01'
    GROUP BY user_id
) AS per_user
GROUP BY tweet_bucket;

-- Same problem as a CTE
WITH tweets_per_user AS (
    SELECT user_id, COUNT(tweet_id) AS tweet_bucket
    FROM tweets
    WHERE tweet_date >= '2022-01-01' AND tweet_date < '2023-01-01'
    GROUP BY user_id
)
SELECT tweet_bucket, COUNT(user_id) AS users_num
FROM tweets_per_user
GROUP BY tweet_bucket;
