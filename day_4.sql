Day 4 of SQL Advent Calendar
Today's Question:

You’re planning your next ski vacation and want to find the best regions with heavy snowfall. Given the tables resorts and snowfall, find the average snowfall for each region and sort the regions in descending order of average snowfall. Return the columns region and average_snowfall.

Table name: ski_resorts

resort_id	resort_name	region
1	Snowy Peaks	Rocky Mountains
2	Winter Wonderland	Wasatch Range
3	Frozen Slopes	Alaska Range
4	Powder Paradise	Rocky Mountains
Table name: snowfall

resort_id	snowfall_inches
1	60
2	45
3	75
4	55

Question level of difficulty: Medium
---------------------------------------------------------------------------------------
Challenge answer

SELECT
    region,
    AVG(snowfall_inches) AS average_snowfall
FROM
    ski_resorts AS A
INNER JOIN snowfall AS B ON A.resort_id = B.resort_id
GROUP BY
    region
ORDER BY
    average_snowfall DESC;


