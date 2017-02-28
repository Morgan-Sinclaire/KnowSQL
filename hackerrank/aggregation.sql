SELECT COUNT(*)
FROM city
WHERE population > 100000

SELECT SUM(population)
FROM city
WHERE district = 'California'

SELECT AVG(population)
FROM city
WHERE district = 'California'

SELECT FLOOR(AVG(population))
FROM city

SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN'

SELECT MAX(population) - MIN(population)
FROM city

SELECT CEIL(AVG(salary - REPLACE(salary, '0', '')))
FROM employees

SELECT months*salary as earnings, COUNT(*)
FROM employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1

SELECT ROUND(SUM(lat_n), 2), ROUND(SUM(long_w), 2)
FROM station

SELECT ROUND(SUM(lat_n), 4)
FROM station
WHERE lat_n > 38.788 AND lat_n < 137.2345

SELECT ROUND(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345

SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n = (
SELECT MAX(lat_n)
FROM station
WHERE lat_n < 137.2345)

SELECT ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.778

SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n =
(SELECT MIN(lat_n)
FROM station
WHERE lat_n > 38.778)

SELECT ROUND(MAX(long_w) - MIN(long_w) + MAX(lat_n) - MIN(lat_n), 4)
FROM station

SELECT ROUND(POWER(POWER(MAX(long_w) - MAX(lat_n), 2) + POWER(MIN(long_w) - MIN(lat_n), 2), .5), 4)
FROM station

SET @ct := (SELECT COUNT(1) FROM station);
SET @row_id := 0;
SELECT ROUND(AVG(lat_n), 4) as median
FROM (SELECT * FROM station ORDER BY lat_n) AS stuff
WHERE (SELECT @row_id := @row_id + 1)
BETWEEN @ct/2.0 AND @ct/2.0 + 1
