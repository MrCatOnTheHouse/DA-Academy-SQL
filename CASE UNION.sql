SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name,CASE
when s.age BETWEEN 0 AND 21 then  "Gen Z"
when s.age BETWEEN 22 AND 25 then "Millenial"
when s.age >= 26 then "Baby Boomer"
ELSE 'Not available'
END AS AsSocialKnown
FROM students AS s;

(SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, 'Gen z'
FROM students AS s
WHERE s.age >= 0 AND s.age <= 21)
UNION
(SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, 'Millenial'
FROM students AS s
WHERE s.age >= 22 AND s.age <= 25)
UNION
(SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, 'Baby Boomer'
FROM students AS s
WHERE s.age > 26);

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, g.GRADE
FROM students AS s
LEFT JOIN grades AS g ON g.STUDENT_ID = s.studentId;

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, g.GRADE
FROM students AS s
LEFT JOIN grades AS g ON g.STUDENT_ID = s.studentId
WHERE g.GRADE IS NULL;


SELECT s.state , COUNT(s.state) AS Students_per_state
FROM students AS s
GROUP BY s.state
HAVING Students_per_state > 1;