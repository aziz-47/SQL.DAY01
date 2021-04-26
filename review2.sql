--PRIMARY KEY olsuturmainin 1. yolu 

CREATE TABLE student2
(
   id CHAR(11) PRIMARY KEY,
   name VARCHAR2(50),
   grade NUMBER(3),
   address VARCHAR2(80),
   update_date  DATE
);

DROP TABLE student2;

--primary key olsuturmanin 2.yolu

CREATE TABLE studen4
(
   id CHAR(11),
   name VARCHAR2(50),
   grade NUMBER(3),
   address VARCHAR2(80),
   update_date  DATE,
   CONSTRAINT id_pk PRIMARY KEY(id)
);

DROP TABLE student4;

 


