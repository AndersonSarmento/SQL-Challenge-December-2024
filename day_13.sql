Day 13 of SQL Advent Calendar
Today's Question:

We need to make sure Santa's sleigh is properly balanced. Find the total weight of gifts for each recipient.

Table name: gifts

gift_id	gift_name	recipient	weight_kg
1	Toy Train	John	2.5
2	Chocolate Box	Alice	0.8
3	Teddy Bear	Sophia	1.2
4	Board Game	John	0.9
Question level of difficulty:
Medium
GrinchGrinchGray Grinch
----------------------------------------------------------------
SELECT
    recipient,
    SUM(weight_kg) as 'total_weight '
FROM
    gifts
GROUP BY
    recipient
