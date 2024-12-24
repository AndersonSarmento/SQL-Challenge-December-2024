Day 23 of SQL Advent Calendar
Today's Question:

The Grinch tracked his weight every day in December to analyze how it changed daily. Write a query to return the weight change (in pounds) for each day, calculated as the difference from the previous day's weight.

Table name: grinch_weight_log

log_id	day_of_month	weight
1	1	250
2	2	248
3	3	249
4	4	247
5	5	246
6	6	248
Question level of difficulty:
Medium
GrinchGrinchGray Grinch

-------------------------------------------------------------------------
SELECT
    gw1.day_of_month,
    gw1.weight - COALESCE(gw2.weight, gw1.weight) AS weight_change
FROM
    grinch_weight_log gw1
LEFT JOIN
    grinch_weight_log gw2 ON gw1.day_of_month = gw2.day_of_month + 1
ORDER BY
    gw1.day_of_month;