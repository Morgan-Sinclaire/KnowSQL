SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000

SELECT name
FROM city
WHERE population > 120000 and CountryCode = 'USA'

SELECT *
FROM city

SELECT *
FROM city
WHERE ID=1661

SELECT *
FROM city
WHERE countrycode='JPN'

SELECT name
FROM city
WHERE countrycode='JPN'

SELECT city,state
FROM station

SELECT DISTINCT city
FROM station
WHERE ID % 2 = 0

SELECT COUNT(city) - COUNT(DISTINCT city)
FROM station

(SELECT city, length(city)
FROM station
ORDER BY length(city), city
LIMIT 1)
UNION
(SELECT city, length(city)
FROM station
ORDER BY length(city) DESC, city
LIMIT 1)

SELECT DISTINCT city
FROM station
WHERE city LIKE 'a%' OR
city LIKE 'e%' OR
city LIKE 'i%' OR
city LIKE 'o%' OR
city LIKE 'u%'

SELECT DISTINCT city
FROM station
WHERE city LIKE '%a' OR
city LIKE '%e' OR
city LIKE '%i' OR
city LIKE '%o' OR
city LIKE '%u'

SELECT city
FROM station
WHERE LEFT(city, 1) IN ('a', 'e', 'i', 'o', 'u') AND
RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u')

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')

SELECT DISTINCT city
FROM station
WHERE RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u') OR
RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')

SELECT DISTINCT city
FROM station
WHERE LEFT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u') AND
RIGHT(city, 1) NOT IN ('a', 'e', 'i', 'o', 'u')

SELECT name
FROM students
WHERE marks > 75
ORDER BY RIGHT(name, 3), id

SELECT name
FROM employee
ORDER BY name

SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id
