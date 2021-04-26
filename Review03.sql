CREATE TABLE students
(
   student_id CHAR(7),
   students_name VARCHAR2(50),
   students_grade NUMBER(3),
   students_cinsiyet CHAR(5)
);

--bir tablonun butu fieldalrina data eklemek
INSERT INTO students VALUES('202031','Ali Can',87,'Erkek');
INSERT INTO students VALUES('2020301','Veli Han',93,'Erkek');
INSERT INTO students VALUES('2020303','Ayse Tan',91,'Kiz');

--bir tablonun belli filedalrina data eklemek

INSERT INTO students(student_id,students_name,students_cinsiyet) VALUES('2020304','Emine Kan','Kiz');
INSERT INTO students(students_name,students_cinsiyet)VALUES('Asim Genc','Erkek');

SELECT* FROM students;

CREATE TABLE students_family
(
   student_id CHAR(7) UNIQUE,
   mother_name VARCHAR2(50) NOT NULL,
   father_name VARCHAR2(50),
   address VARCHAR2(80)
);


--INSERT INTO kullanirken dikat edilmesi gerekenler 
--1) Constraintlerler calisan data girisi yapmayin
--2) Dta tayplarina uygun veriler girin
--3) sutun siralari ile data siralari uyugun olmalidir
INSERT INTO students_family VALUES('202031','Halime','Recep','Istanbul-Bakirkoy');
INSERT INTO students_family VALUES('2020302','Melehat','Kerem','Istanbul-Basaksehir');
INSERT INTO students_family(student_id,father_name,address) VALUES('2020304','Ramazan','Istanbul-Bagcilr');
INSERT INTO students_family VALUES('2020303','Ayse','Kemal','Istanbul Catalca');
INSERT INTO students_famýly VALUES('2020305','Ayse','Veli','Istanbul Kadikoy');

--Bir tablodaki adressi degsitridik
UPDATE students_family
SET address = 'Ankara Cankaya'
WHERE student_id='202031';


--Anne adi ayse olanalrin adreslerini Bursa Uludag yapalim
UPDATE students_family
SET address = 'Bursa ULUDAG'
WHERE mother_name='Ayse';





SELECT* FROM students_family;

DROP TABLE students_family;
