 CREATE TABLE calisanlar
 (
 id CHAR(4),
 isim VARCHAR2(50),
 maas NUMBER(5),
 CONSTRAINT id_pk PRIMARY KEY (id)
 );
 INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
 INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yýlmaz' ,12000);
 INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
 INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
 CREATE TABLE aileler
 (
 id CHAR(4),
 cocuk_sayisi VARCHAR2(50),
 ek_gelir NUMBER(5),
 CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
 );
 
 INSERT INTO aileler VALUES('1001', 4, 2000);
 INSERT INTO aileler VALUES('1002', 2, 1500);
 INSERT INTO aileler VALUES('1003', 1, 2200);
 INSERT INTO aileler VALUES('1004', 3, 2400);
 
  /*4 Çalýþanlarýn isim ve cocuk_sayisi'ni listeleyen bir sorgu yazýnýz. Komut 
sonrasý görünüm aþaðýdaki gibidir.*/
Select isim,(SELECT cocuk_sayisi
 From aileler  where id=calisanlar.id) cocuksayisi
 from calisanlar;
 
 /*5calisanlar' ýn id, isim ve toplam_gelir'lerini gösteren bir sorgu yazýnýz. 
 toplam_gelir = calisanlar.maas + aileler.ek_gelir*/
 
 SELECT id,isim,(select sum(maas+ek_gelir)
                                                                from aileler WHERE id=calisanlar.id) as toplam_gelir 
     
 FROM calisanlar;
 
/*6 Eðer bir ailenin kiþi baþý geliri 2000 TL den daha az ise o çalýþanýn
 -- maaþýna ek %10 aile yardým zammý yapýnýz. 
 -- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)*/
 
 Update calisanlar
 Set maas=maas*1.10
 where 2000> (Select (maas+ ek_gelir )/(cocuk_sayisi+2)
                                            from aileler Where aileler.id=calisanlar.id) ;
 
 select *
 from calisanlar;
 