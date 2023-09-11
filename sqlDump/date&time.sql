select extract(second from now()) as date;	--minute,hour,day,month,year

select date_part('dow',cast('2023-07-16'as date)) as date;		--minute,second,hour,day,month,year
---OUTPUT:
---0

------sunday to saturday -----> 0 to 6

select interval '2hours 3seconds';		---02:00:03

SELECT DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month - 1 day';		--returns last day of current month		--The precision argument can take values like 'year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', etc.	


SELECT date_part('year', AGE('2023-07-18', '2000-01-01'));		--23

SELECT  AGE('2023-07-18', '2000-01-01');				--23 years 6 mons 17 days

