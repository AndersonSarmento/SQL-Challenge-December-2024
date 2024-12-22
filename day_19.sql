Day 19 of SQL Advent Calendar
Today's Question:

Scientists are studying the diets of polar bears. Write a query to find the maximum amount of food (in kilograms) consumed by each polar bear in a single meal December 2024. Include the bear_name and biggest_meal_kg, and sort the results in descending order of largest meal consumed.

Table name: polar_bears

bear_id	bear_name	age
1	Snowball	10
2	Frosty	7
3	Iceberg	15
Table name: meal_log

log_id	bear_id	food_type	food_weight_kg	date
1	1	Seal	30	2024-12-01
2	2	Fish	15	2024-12-02
3	1	Fish	10	2024-12-03
4	3	Seal	25	2024-12-04
5	2	Seal	20	2024-12-05
6	3	Fish	18	2024-12-06
Question level of difficulty:
Medium
GrinchGrinchGray Grinch

============================================================================================
SELECT
    a.bear_name,
    MAX(b.food_weight_kg)  as 'biggest_meal_kg'
FROM
    polar_bears as a
INNER JOIN meal_log as b ON a.bear_id = b.bear_id
WHERE
    b.date >= '2024-12-01' AND b.date <= '2024-12-31'  -- Use >= and <= for the date range
GROUP BY
    bear_name
ORDER BY
    biggest_meal_kg DESC;
Correct!! 🎉 Great work!