SELECT * FROM students;


SELECT *
FROM students
WHERE state = 'Nuevo Leon';

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, g.CLASS_NAME, g.GRADE
FROM students AS s
JOIN grades AS g ON g.STUDENT_ID = s.studentId;


SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, g.GRADE
FROM students AS s
LEFT JOIN grades AS g
ON g.STUDENT_ID = s.studentId;

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, s.capability, CASE 
when s.gender = 'M' then 'Male' when s.gender = 'F' then 'Female' ELSE 'Not available' END AS GENDER
FROM students AS s;

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name, IF s.age IS >= 0 AND <= 21 then 'Gen Z'
																				ELSEIF s.age IS >= 22 AND <= 25 then 'Milenial'
																				ELSEIF s.age IS > 26 then 'Milenial'
FROM students AS s


IF (SELECT s.age FROM students AS s
	 WHERE s.age IS >= 0 AND <= 21) = 'Gen Z'
SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name.
FROM students AS s

ELSEIF (SELECT s.age FROM students AS s
	 WHERE s.age IS >= 22 AND <= 25) = 'Milenial'
SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name
FROM students AS s

ELSEIF (SELECT s.age FROM students AS s
	 WHERE s.age IS > 26) = 'Boomer'
SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name
FROM students AS s

ELSE (SELECT 'Not available');
	 
SELECT IF(1>2, "YES", "NO") AS 'Is 1 grater than 2?';

SELECT IF(1<2, "YES", "NO") AS 'Is 1 less than 2?';
