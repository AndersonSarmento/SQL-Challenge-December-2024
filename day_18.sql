Day 18 of SQL Advent Calendar
Today's Question:

A travel agency is promoting activities for a "Summer Christmas" party. They want to identify the top 2 activities based on the average rating. Write a query to rank the activities by average rating.

Table name: activities

activity_id	activity_name
1	Surfing Lessons
2	Jet Skiing
3	Sunset Yoga
Table name: activity_ratings

rating_id	activity_id	rating
1	1	4.7
2	1	4.8
3	1	4.9
4	2	4.6
5	2	4.7
6	2	4.8
7	2	4.9
8	3	4.8
9	3	4.7
10	3	4.9
11	3	4.8
12	3	4.9
Question level of difficulty:
Hard
GrinchGrinchGrinch
============================================================================================
SELECT
    a.activity_name,
    a.activity_id,
    AVG(r.rating) AS average_rating,
    RANK() OVER (ORDER BY AVG(r.rating) DESC) AS activity_rank
FROM
    activities a
INNER JOIN
    activity_ratings r
    ON a.activity_id = r.activity_id
GROUP BY
    a.activity_id
ORDER BY
    activity_rank
LIMIT 2;