SELECT SUM(city.population)
FROM city
JOIN country
ON city.countrycode = country.code
WHERE country.continent = 'Asia'

SELECT city.name
FROM city
JOIN country
ON city.countrycode = country.code
WHERE country.continent = 'Africa'

SELECT continent, FLOOR(AVG(city.population))
FROM city
JOIN country
ON city.countrycode = country.code
GROUP BY continent

SELECT name, grade, marks
FROM students
JOIN grades
ON marks BETWEEN min_mark AND max_mark
WHERE grade >= 8
ORDER BY grade DESC, name;
SELECT NULL, grade, marks
FROM students
JOIN grades
ON marks BETWEEN min_mark AND max_mark
WHERE grade < 8
ORDER BY grade DESC, marks;

SELECT hackers.hacker_id, hackers.name
FROM difficulty
JOIN challenges
ON difficulty.difficulty_level = challenges.difficulty_level
JOIN submissions
ON submissions.challenge_id = challenges.challenge_id
JOIN hackers
ON hackers.hacker_id = submissions.hacker_id
WHERE difficulty.score = submissions.score
GROUP BY hacker_id
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, hacker_id
