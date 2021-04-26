--supplier_id, supplier_name ve contact_name isimli sutunlari iceren supplier bir tablo oslusturunuz
--product_id, product_name, ve costumer_name isimli sutunlari iceren products isimli bir tablo olsurunuz
--product table parent tablo olacak skeilde suuplier id foreign key yapiniz

CREATE TABLE suppliers
(

  supplier_id number(11) PRIMARY KEY,
  supplier_name VARCHAR2(50),
  cantact_name VARCHAR2(50)
);

INSERT INTO suppliers VALUES(100,'IBM','ALI CAN');
INSERT INTO suppliers VALUES(101,'APPLE','MERVE TEMIZ');
INSERT INTO suppliers VALUES(102,'SAMSUNG','KEMAL CAN');
INSERT INTO supplýers VALUES(103,'LG','ALI CAN');




CREATE TABLE products
(
  supplier_id NUMBER(11),
  product_id NUMBER(11),
  product_name VARCHAR2(50),
  costumer_name VARCHAR2(50),
  CONSTRAINT supplier_id_fk FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

 INSERT INTO products VALUES(100,1001,'Laptop','Suleyman');
 INSERT INTO products VALUES(101,1002,'Ipat','Fatma');
 INSERT INTO products VALUES(102,1003,'TV','Ramzan');
 INSERT INTO products VALUES(103,1004,'Phone','ALI CAN');
 
 DROP TABLE products;
 
 
 SELECT* FROM products;

--ALI CANIN adligi urunu Merve temiz sattigi marakdan olsun

SELECT supplier_name
FROM suppliers
WHERE contact_name= 'Merve Temiz';

UPDATE products
SET product_name= (SELECT supplier_name
                    FROM suppliers
                    WHERE cantact_name= 'MERVE TEMIZ')
WHERE costumer_name ='ALI CAN';     

--Product id si 1001 olan prodcut in product name ni Kemal Canin temsilcisin oldugu marka yapin

SELECT supplier_name
FROM suppliers
WHERE cantact_name='KEMAL CAN';

UPDATE products
SET product_name=(SELECT supplier_name
FROM suppliers
WHERE cantact_name='KEMAL CAN')
WHERE product_ýd=1001;


--tv alan musterinin customer name ni apple satan isme donsurutunuz

UPDATE products
SET costumer_name =(SELECT cantact_name
                    FROM suppliers
                    WHERE supplier_name='APPLE'
                    )
 WHERE product_name='TV';                   

SELECT* FROM products;
SELECT* FROM suppliers;

--tablodan istenilen satiri silmek
DELETE FROM products
WHERE supplier_id= 103;

SELECT* FROM products;


--prdouict tablosundan costumer name fatma olani satiri siliniz
--SQL de istenen sartlara uyan satir yoksa SQL sile islemi yapmaz ama error dda vermez
DELETE FROM products
WHERE costumer_name='Fatma';

--TABLOADAKI TUM SATIRLARI SILMEK ICIN
--DELETE FROM products bu code tabodaki tum datalari siler ama tabalo yapsi durur


DELETE FROM products;

--1 den fazla satir silme
DELETE FROM products
WHERE supplier_id<102;

--AND kullanarak silme 
--AND kullanirsaniz iki sarti saglayan satri bulur ve siler.Iki sart birden saglanamzsa silme islemi gercklesmez
DELETE FROM products
WHERE product_name= 'Phone' AND costumer_name='Ramazan';

--OR kullanarak silmek

DELETE FROM products
 WHERE product_name= 'Phone' OR costumer_name='Ramazan';
 
 TRUNCATE TABLE products;
 
 --DROP :Bir table
 
 CREATE TABLE products
(
  supplier_id NUMBER(11),
  product_id NUMBER(11),
  product_name VARCHAR2(50),
  costumer_name VARCHAR2(50)
);


 INSERT INTO products VALUES(100,1001,'Laptop','Suleyman');
 INSERT INTO products VALUES(101,1002,'Ipat','Fatma');
 INSERT INTO products VALUES(102,1003,'TV','Ramzan');
 INSERT INTO products VALUES(103,1004,'Phone','ALI CAN');

SELECT* FROM products;

--DROP bir tabloyu icindeki datalariyla birlikte silmek icin kullanilir.
--DROP kullanrak imha ettigimiz table bazi kodlar kullnarak geri cagrilabilri
--RP kullanarak imha ettigimiz table yi gerci cagilmasini engllemk istiyorsak
DROP TABLE products PURGE; --BU KOD ILE TABLO BIR DAHA GERI GELMEZ


--1)Tbalodaki tum datalari goremk icin kod yazniz

SELECT* FROM products;

--2) Tbalodaki belli bir satiri goremk icin 
--WHERE KULLNILMASI GEREKI. WHERE filtrelemey yarar
SELECT* FROM products
WHERE costumer_name='Suleyman';

--3)Tbaldaki bazi satirli gormek icin
--1 den fazla satir goremk iicn OR kullani;labilri
SELECT*
FROM products
WHERE supplier_id =101 OR supplier_id=103;

--1den fazla satir goremk icin OR dan daha kisa cozum IN kullnamaktir
 SELECT*
 FROM products
 WHERE supplier_id IN(101,102,103);
 
 --1 DEN FAZLA SATIR GORENK ICIN < VYE A> ISRATI DE KULLANLIR
 SELECT* FROM products
 WHERE supplier_id<103;
 
 --4)Bi tablodaki belli bir sutunu gormk icin 
 SELECT costumer_name
 FROM products;
 
 --5 bir tabloda 1 den fazla sutun gormek icin
 SELECT costumer_name,product_name
 FROM products;
 
 --6) Bir tablo da 1 den fazla sutun ve 1 satir gorek icin 
 SELECT costumer_name,product_name
 FROM products 
 WHERE costumer_name='Suleyman';
 
 --product table da supplier id si 101 den kucuk olan veya 102 den buyuk olanalrin
 --product nemaegosteren kodu yaziniz
 
 SELECT product_name
 FROM products
 WHERE supplier_id<101 OR supplier_id>102;








