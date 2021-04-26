CREATE TABLE hastaneler
(
id char(5) ,
isim varchar2(50),
sehir varchar2(20),
ozel char(1),
CONSTRAINT pk_id PRIMARY KEY(id)
);
INSERT INTO hastaneler VALUES ('H101','ACIBADEM HASTANESI','ISTANBUL','Y');
INSERT INTO hastaneler VALUES ('H102','HASZEKI HASTANESI','ISTANBUL','N');
INSERT INTO hastaneler VALUES ('H103','MEDIKOL HASTANESI','IZMIR','Y');
INSERT INTO hastaneler VALUES ('H104','NEMORYIL HASTANESI','ANKARA','Y');

SELECT
    *
FROM hastaneler;

CREATE TABLE hastalar
(
kimlik_no char(11) ,
isim varchar2(50),
teshis varchar2(20),
CONSTRAINT pk_kimlik_no PRIMARY KEY(kimlik_no)
);

INSERT INTO hastalar VALUES ('12345678901','Ali Can','Gizli Seker');
INSERT INTO hastalar VALUES ('45678901121','Ayse Yilmaz','Hipertansiyon');
INSERT INTO hastalar VALUES ('78901234510','Steve Job','Pankreatit');
INSERT INTO hastalar VALUES ('12344321251','Tom Hanks','COVID 19');

SELECT
    *
FROM hastalar;
DROP TABLE hastalar ;


CREATE TABLE Bolumler
(
bolum_id VARCHAR(10),
bolum_adi VARCHAR2(30),
CONSTRAINT pk_bolumid PRIMARY KEY(bolum_id)

);
INSERT INTO bolumler VALUES ('DHL','Dahiliye');
INSERT INTO bolumler VALUES ('KBB','Kulak-Burun-Boðaz');
INSERT INTO bolumler VALUES ('NRJ','Noroloji');
INSERT INTO bolumler VALUES ('GAST','Gastroloji');
INSERT INTO bolumler VALUES ('KARD','Kardiyoloji');
INSERT INTO bolumler VALUES ('PSK','Psikiyatri');
INSERT INTO bolumler VALUES ('GOZ','Goz Hastalýklari');

SELECT
    *
FROM bolumler;

CREATE TABLE hasta_kayitlar
(
kimlik_no CHAR(11) ,
hasta_isim VARCHAR(20) default 'NONAME',
hastane_adi VARCHAR(30),
bolum_adi VARCHAR(20),
teshis VARCHAR2(30),
CONSTRAINT pk_kimlikNo  PRIMARY KEY(kimlik_no)

);
DROP TABLE hasta_kayitlar ;
SELECT
    *
FROM hasta_kayitlar;

INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('1111');
INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('2222');
INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('3333');
--kayýt 3333 nolu hasta update edildi
UPDATE hasta_kayitlar SET hasta_isim='SAlvador Dali',
                                              hastane_adi='John Hopins',
                                              bolum_adi='Noroloji',
                                              teshis='Parkinson',
                                              kimlik_no='99991111222'
                                              WHERE kimlik_no='3333';
  --kayit 1111 nolu hasta update edilecek
  UPDATE hasta_kayitlar 
  set hasta_isim=(SELECT isim FROM hastalar where isim='Ali Can'),
        hastane_adi=(Select isim From hastaneler where id='H104'),
        bolum_adi=(Select bolum_adi From bolumler where bolum_id='DHL'),
        teshis=(SELECT isim From hastalar where isim='Ali Can'),
        kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
where kimlik_no='1111';        


HKK, 14:59
CREATE TABLE hastaneler
(
id char(5) ,
isim varchar2(50),
sehir varchar2(20),
ozel char(1),
CONSTRAINT pk_id PRIMARY KEY(id)
);
INSERT INTO hastaneler VALUES ('H101','ACIBADEM HASTANESI','ISTANBUL','Y');
INSERT INTO hastaneler VALUES ('H102','HASZEKI HASTANESI','ISTANBUL','N');
INSERT INTO hastaneler VALUES ('H103','MEDIKOL HASTANESI','IZMIR','Y');
INSERT INTO hastaneler VALUES ('H104','NEMORYIL HASTANESI','ANKARA','Y');

SELECT
    *
FROM hastaneler;

CREATE TABLE hastalar
(
kimlik_no char(11) ,
isim varchar2(50),
teshis varchar2(20),
CONSTRAINT pk_kimlik_no PRIMARY KEY(kimlik_no)
);

INSERT INTO hastalar VALUES ('12345678901','Ali Can','Gizli Seker');
INSERT INTO hastalar VALUES ('45678901121','Ayse Yilmaz','Hipertansiyon');
INSERT INTO hastalar VALUES ('78901234510','Steve Job','Pankreatit');
INSERT INTO hastalar VALUES ('12344321251','Tom Hanks','COVID 19');

SELECT
    *
FROM hastalar;
DROP TABLE hastalar ;


CREATE TABLE Bolumler
(
bolum_id VARCHAR(10),
bolum_adi VARCHAR2(30),
CONSTRAINT pk_bolumid PRIMARY KEY(bolum_id)

);
INSERT INTO bolumler VALUES ('DHL','Dahiliye');
INSERT INTO bolumler VALUES ('KBB','Kulak-Burun-Boðaz');
INSERT INTO bolumler VALUES ('NRJ','Noroloji');
INSERT INTO bolumler VALUES ('GAST','Gastroloji');
INSERT INTO bolumler VALUES ('KARD','Kardiyoloji');
INSERT INTO bolumler VALUES ('PSK','Psikiyatri');
INSERT INTO bolumler VALUES ('GOZ','Goz Hastalýklari');

SELECT
    *
FROM bolumler;

CREATE TABLE hasta_kayitlar
(
kimlik_no CHAR(11) ,
hasta_isim VARCHAR(20) default 'NONAME',
hastane_adi VARCHAR(30),
bolum_adi VARCHAR(20),
teshis VARCHAR2(30),
CONSTRAINT pk_kimlikNo  PRIMARY KEY(kimlik_no)

);
DROP TABLE hasta_kayitlar ;
SELECT
    *
FROM hasta_kayitlar;

INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('1111');
INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('2222');
INSERT INTO hasta_kayitlar(kimlik_no) VALUES ('3333');
--kayýt 3333 nolu hasta update edildi
UPDATE hasta_kayitlar SET hasta_isim='SAlvador Dali',
                                              hastane_adi='John Hopins',
                                              bolum_adi='Noroloji',
                                              teshis='Parkinson',
                                              kimlik_no='99991111222'
                                              WHERE kimlik_no='3333';
  --kayit 1111 nolu hasta update edilecek
  UPDATE hasta_kayitlar 
  set hasta_isim=(SELECT isim FROM hastalar where isim='Ali Can'),
        hastane_adi=(Select isim From hastaneler where id='H104'),
        bolum_adi=(Select bolum_adi From bolumler where bolum_id='DHL'),
        teshis=(SELECT teshis From hastalar where isim='Ali Can'),
        kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
where kimlik_no='1111';    
--2222 nolu kaydý update ediniz.

UPDATE hasta_kayitlar 
SET hasta_isim=(SELECT isim  from hastalar where isim='Ayse Yilmaz'),
       hastane_adi=(SELECT isim from hastaneler where id='H103'),
       bolum_adi=(Select bolum_adi from bolumler where bolum_id='KBB'),
       teshis=(Select teshis from hastalar where isim='Tom Hanks'),
       kimlik_no=(Select kimlik_no from hastalar where isim='Steve Job')
  WHERE kimlik_no='2222';     
       
       SELECT
           *
       FROM hasta_kayitlar;

DROP TABLE hasta_kayitlar;
