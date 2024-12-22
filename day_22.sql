Today's Question:

We are hosting a gift party and need to ensure every guest receives a gift. Using the guests and guest_gifts tables, write a query to identify the guest(s) who have not been assigned a gift (i.e. they are not listed in the guest_gifts table).

Table name: guests

guest_id	guest_name
1	Cindy Lou
2	The Grinch
3	Max the Dog
4	Mayor May Who
Table name: guest_gifts

gift_id	guest_id	gift_name
1	1	Toy Train
2	1	Plush Bear
3	2	Bag of Coal
4	2	Sleigh Bell
5	3	Dog Treats
Question level of difficulty:
Medium
GrinchGrinchGray Grinch
---------------------------------------------------------------------------------------
Challenge answer

SELECT *
FROM guests as a 
    LEFT JOIN guest_gifts as b ON a.guest_id = b.guest_id
WHERE b.guest_id IS NULL
