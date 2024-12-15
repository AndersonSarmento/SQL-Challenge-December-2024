Day 14 of SQL Advent Calendar
Today's Question:

Which ski resorts had snowfall greater than 50 inches?

Table name: snowfall

resort_name	location	snowfall_inches
Snowy Peaks	Colorado	60
Winter Wonderland	Utah	45
Frozen Slopes	Alaska	75
Question level of difficulty:
Easy
GrinchGray GrinchGray Grinch
----------------------------------------------------------------------------
select 
    resort_name,
    snowfall_inches
from
    snowfall
where
    snowfall_inches > 50