
CREATE TABLE ogrenciler
(
    id NUMBER(9),
    isim VARCHAR2(50),
    adres VARCHAR2(100),
    sinav_notu NUMBER(3)
);

INSERT INTO ogrenciler VALUES(123,'Ali Can','Ankara',75);
INSERT INTO ogrenciler VALUES(124,'Merve Gul','Ankara',85);
INSERT INTO ogrenciler VALUES(125,'Kemal Yasa','Istanbul',75);

SELECT* FROM ogrenciler;

DROP TABLE ogrenciler;

SELECT* FROM ogrenciler
WHERE sinav_notu>80;

SELECT isim,sinav_notu
FROM ogrencýler
WHERE SINAV_NOTU>80;

SELECT* FROM ogrenciler
WHERE adres ='Ankara';


CREATE TABLE personel
(
 id CHAR(5),
 isim VARCHAR2(50),
 maas NUMBER(5)
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Veli Han',7215);
INSERT INTO personel VALUES('10004','Mustfa Ali',5000);
INSERT INTO personel VALUES('10005','Ayse Can',55000);
INSERT INTO personel VALUES('10006','Meryem',4000);

SELECT* FROM personel;

DROP TABLE personel;

/*==============================BETWEEN======================*/
--id si 10001 ile 10005 arasinda olan personnlerin bilgilerini listeleyiniz
SELECT*FROM personel
WHERE id>='10001' AND id<='10005'; --ALT ve UST limitler dahildir

SELECT id, maas
FROM personel
WHERE id BETWEEN '10002' AND '10005';

--Mehmet Yilmaz ile Veli Han arasindkai personel bilgileirni lsiteleyiniz
SELECT* FROM personel
WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';

--id si 10002 ile 10004 arasinda olmayalari listele
SELECT* FROM personel
WHERE id NOT BETWEEN '10002' AND '10004';

/*==============================IN======================*/

--id si 10001, 10002 ve 10004  olanalri lsitelyalim 
--OR yonetmiyle 

SELECT* FROM personel
WHERE id='10001' OR id='10002' OR id='10004';

--IN yontemiyle
SELECT* FROM personel
WHERE id IN('10001','10002','10004');

--maasi sadece 7000 ve 12000 arasinda olan personlleri lsitelyiniz

SELECT* FROM personel
WHERE maas IN(7000,12000);

SELECT* FROM personel
WHERE isim LIKE 'M%';

--ISIMI 6 HANELI OLANALRI GOSTER
SELECT* FROM personel
WHERE isim LIKE '______';

--2. HARFI e olanalri listeleylim
SELECT* FROM personel
WHERE isim LIKE '_e%';

--Maasinin son iki hnasei 00 olan personelelri listeleyelim
SELECT* FROM personel
WHERE maas LIKE '%00';

--birinci harfi 1 harfi a ve 7 hari a olan personnleri lsiteleyelim
SELECT* FROM personel
WHERE isim LIKE 'A_____A%';

--isminde an kelimesi gecen personellleri lsiteleyiniz
SELECT* FROM personel
WHERE isim LIKE '%an%';

--maasi  4 basamakli olmayanalri goster
SELECT* FROM personel
WHERE maas NOT LIKE '____';

--maasi 5 basamakli olmayan personlelri listeleyiniz
SELECT* FROM personel
WHERE maas NOT LIKE '_____';


/*======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir. 
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ’, ‘c’ ] )
           
========================================================================== */

   CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT* FROM kelimeler;
    
    --icerosinde 'hi' olan kelimerlri sorgulayiniz
    
    SELECT* FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    --icerosinde herhangi bir yerinde h veya i bulunanna kelimer
    SELECT* FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[hi]');
    
    --icersinde ot veya at harfaleri olan kelimelri sorguulayiniz
    --veya islemi karakteri ile yapilir
    
   SELECT* FROM kelimeler
   WHERE REGEXP_LIKE(kelime,'ot|at');
   
   --'i' harfi koyunca case senstive olarak alir buyuk kucuk farketmez heopsni alir
   SELECT* FROM kelimeler
   WHERE REGEXP_LIKE(kelime,'ot|at','i');
   
   --icersinde hi veya ho ile baslayan  kelimelri sorguulayiniz
    --baslama icin ^ karakteri kullanilir
    
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'^hi|^ho','i');
     
     --t veya m ile biten kelimelri Buyk kucuk harf duyarsiz seklinde listeleyiniz
     --bitis icin $ isareti kullanilir
     
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'t$|m$','i');
     
     --h ile baslayip t ile biten 3 harfli kelimelri buyuk kucuk dikkat etmeksizi listeleyiniz
     -- -(tire) karakteri aralik belirtir
     -- koslei parantes [] tek bir karakteri gosterir
     
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'h[a-z0-9]t','i');
     
     --ilk harfi h son harfi t olup 2. harfi a veya i olan 3 harfli kelimelrin tumunu yazniz
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'h[ai]t','i');
     
     --icerisinde m veya i veya e olan kelimelrin tum bilgilserini listeleyiniz
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'[mie](*)');
    
   -- içerisinde en az 2 adet oo barýdýran kelimelerin tüm bilgilerini
   --listeleyiniz.
   --{2}
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'[o]{2}','i');
     
     SELECT* FROM kelimeler
     WHERE REGEXP_LIKE(kelime,'[a]{2}','i');
    
    
    
    
    
    





    





