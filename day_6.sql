Day 6 of SQL Advent Calendar
Today's Question:

Scientists are tracking polar bears across the Arctic to monitor their migration patterns and caloric intake. Write a query to find the top 3 polar bears that have traveled the longest total distance in December 2024. Include their bear_id, bear_name, and total_distance_traveled in the results.
------------------------------------------------------------------------------------
Table name: polar_bears

bear_id	bear_name	age
1	Snowball	10
2	Frosty	7
3	Iceberg	15
4	Chilly	5
Table name: tracking
------------------------------------------------------------------------------------
tracking_id	bear_id	distance_km	date
1	1	25	2024-12-01
2	2	40	2024-12-02
3	1	30	2024-12-03
4	3	50	2024-12-04
5	2	35	2024-12-05
6	4	20	2024-12-06
7	3	55	2024-12-07
8	1	45	2024-12-08
Question level of difficulty: Hard
------------------------------------------------------------------------------------
Challenge answer

select 
	a.bear_id, bear_name, 
	sum(distance_km)total_distance_traveled
from polar_bears as A
INNER JOIN tracking as B
ON a.bear_id=b.bear_id
where b.date between '2024-12-01' and '2024-12-31'
group by
	a.bear_id
order by
	total_distance_traveled desc
limit 3;



------------------------------------------------------------------------------------
bear_id	bear_name	total_distance_traveled
3	Iceberg	105
1	Snowball	100
2	Frosty	75
Correct!! 🎉 Great work!


