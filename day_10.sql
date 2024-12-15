Day 10 of SQL Advent Calendar
Today's Question:

You are tracking your friends' New Year’s resolution progress. Write a query to calculate the following for each friend: number of resolutions they made, number of resolutions they completed, and success percentage (% of resolutions completed) and a success category based on the success percentage:
- Green: If success percentage is greater than 75%.
- Yellow: If success percentage is between 50% and 75% (inclusive).
- Red: If success percentage is less than 50%.

Table name: resolutions

resolution_id	friend_name	resolution	is_completed
1	Alice	Exercise daily	1
2	Alice	Read 20 books	0
3	Bob	Save money	0
4	Bob	Eat healthier	1
5	Charlie	Travel more	1
6	Charlie	Learn a new skill	1
7	Diana	Volunteer monthly	1
8	Diana	Drink more water	0
9	Diana	Sleep 8 hours	1
Question level of difficulty:
Medium
GrinchGrinchGray GrinchWITH 
------------------------------------------------------------------------------------------------------------------------------
WITH ResolutionCounts AS (
  SELECT
    friend_name,
    COUNT(*) AS total_resolutions,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_resolutions
  FROM
    resolutions
  GROUP BY
    friend_name
)

SELECT
  friend_name,
  total_resolutions,
  completed_resolutions,
  ROUND(completed_resolutions * 100.0 / total_resolutions, 2) AS success_percentage,
  CASE
    WHEN completed_resolutions * 100.0 / total_resolutions > 75 THEN 'Green'
    WHEN completed_resolutions * 100.0 / total_resolutions BETWEEN 50 AND 75 THEN 'Yellow'
    ELSE 'Red'
  END AS success_category
FROM
  ResolutionCounts;