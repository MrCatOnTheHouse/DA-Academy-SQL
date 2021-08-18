DROP TABLE lab.students;
DROP TABLE lab.grades;
CREATE TABLE lab.students(
studentId INTEGER ,
firstName VARCHAR(40),
lastName VARCHAR(40),
state VARCHAR(40),
age INTEGER,
gender CHAR(1),
capability VARCHAR(40)
);



CREATE TABLE lab.grades (
CLASS_NAME VARCHAR(30),
STUDENT_ID INTEGER,
GRADE INTEGER
);



INSERT INTO lab.students VALUES(1,'Edson' , 'Cortes', 'Nuevo Leon', 24, 'M','D&A');
INSERT INTO lab.students VALUES(2, 'Antonio', 'Cisneros', 'Yucatán', 22,'M','D&A');
INSERT INTO lab.students VALUES(3,'David','Murguia','Nuevo Leon',21,'M','D&A');
INSERT INTO lab.students VALUES(4,'Violeta' , 'Hernandez', 'Coah', 27, 'F','D&A');
INSERT INTO lab.students VALUES(5, 'Magda', 'Gonzalez', 'Nuevo Leon', 35, 'F', 'D&A');
INSERT INTO lab.students VALUES(6, 'Jesus', 'Castañeda','Tabasco',25, 'M','D&A');



INSERT INTO lab.grades VALUES('SQL',1 , 10);
INSERT INTO lab.grades VALUES('SQL',2 , 9);
INSERT INTO lab.grades VALUES('SQL',3 , 8);
INSERT INTO lab.grades VALUES('SQL',4 , 10);
INSERT INTO lab.grades VALUES('SQL',5 , 9);
INSERT INTO lab.grades VALUES ('Python', 1, 10);
INSERT INTO lab.grades VALUES ('Python', 2, 9);
INSERT INTO lab.grades VALUES ('Python', 3, 7);
INSERT INTO lab.grades VALUES ('Python', 4, 9);