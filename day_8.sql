Day 8 of SQL Advent Calendar
Today's Question:

You are managing inventory in Santa's workshop. Which gifts are meant for "good" recipients? List the gift name and its weight.

Table name: gifts

gift_id	gift_name	recipient_type	weight_kg
1	Toy Train	good	2.5
2	Lumps of Coal	naughty	1.5
3	Teddy Bear	good	1.2
4	Chocolate Bar	good	0.3
5	Board Game	naughty	1.8
Question level of difficulty: Easy
GrinchGray GrinchGray Grinch
------------------------------------------------------------------------------------
Challenge answer
SELECT 
    gift_name,
    weight_kg
FROM 
    gifts
WHERE
    recipient_type='good'
------------------------------------------------------------------------------------
gift_name	weight_kg
Toy Train	2.5
Teddy Bear	1.2
Chocolate Bar	0.3
Correct!! 🎉 Great work!