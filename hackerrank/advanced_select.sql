SELECT CASE
WHEN a + b <= c OR a + c <= b OR c + b <= a THEN 'Not A Triangle'
WHEN a = b AND b = c THEN 'Equilateral'
WHEN a = b OR b = c OR a = c THEN 'Isosceles'
ELSE 'Scalene' END
FROM triangles

SELECT name + '(' + LEFT(occupation, 1) + ')'
FROM occupations
ORDER BY name
UNION
SELECT 'There are total ' + COUNT(occupation) + ' ' + occupation + 's.'
FROM occupations
ORDER BY COUNT(occupation), occupation

SELECT concat(name, '(', LEFT(occupation, 1), ')')
FROM occupations
ORDER BY name;

SELECT concat('There are total ', COUNT(*), ' ', LOWER(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;

SET @d=0, @p=0, @s=0, @a=0;
SELECT MAX(doctor), MAX(professor), MAX(singer), MAX(actor)
FROM(
  SELECT CASE WHEN occupation='Doctor' THEN (@d:=@d+1)
            WHEN occupation='Professor' THEN (@p:=@p+1)
            WHEN occupation='Singer' THEN (@s:=@s+1)
            WHEN occupation='Actor' THEN (@a:=@a+1) END AS row_number,
    CASE WHEN occupation='Doctor' THEN name END AS doctor,
    CASE WHEN occupation='Professor' THEN name END AS professor,
    CASE WHEN occupation='Singer' THEN name END AS singer,
    CASE WHEN occupation='Actor' THEN name END AS actor
  FROM occupations
  ORDER BY name
) temp
GROUP BY row_number

SELECT n,
CASE WHEN p is NULL THEN 'Root'
WHEN n in (SELECT p FROM bst) THEN 'Inner'
ELSE 'Leaf'
END
FROM bst
ORDER BY n;

SELECT company.company_code, founder,
COUNT(DISTINCT employee.lead_manager_code),
COUNT(DISTINCT employee.senior_manager_code),
COUNT(DISTINCT employee.manager_code),
COUNT(DISTINCT employee.employee_code)
FROM company
JOIN employee
ON company.company_code = employee.company_code
GROUP BY company.company_code
ORDER BY company.company_code
