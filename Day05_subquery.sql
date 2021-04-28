/* ============================= SUBQUERIES ====================================
    SORGU içinde çalýþan SORGUYA SUBQUERY (ALT SORGU) denilir.
==============================================================================*/


  CREATE TABLE personel1 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20)
    );
    
    
    INSERT INTO personel1 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
    INSERT INTO personel1 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
    INSERT INTO personel1 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
    INSERT INTO personel1 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
    INSERT INTO personel1 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
    INSERT INTO personel1 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
    INSERT INTO personel1 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
    
    
    CREATE TABLE sirketler
    (
        sirket_id NUMBER(9), 
        sirket_adi VARCHAR2(20), 
        personel_sayisi NUMBER(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Honda', 12000);
    INSERT INTO sirketler VALUES(101, 'Ford', 18000);
    INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
    INSERT INTO sirketler VALUES(103, 'Toyota', 21000);
    
    SELECT* FROM personel1;
    SELECT* FROM sirketler;
    
    DROP TABLE personel1;
    DROP TABLE sirketler;
    
 /*-----------------------------------------------------------------------------
  ORNEK1: Personel sayýsý 15.000’den cok olan sirketlerin isimlerini ve bu
  sirkette calisan personelin isimlerini listeleyin
-----------------------------------------------------------------------------*/

SELECT isim,sirket FROM personel1
WHERE sirket IN (SELECT sirket_adi FROM sirketler
                WHERE personel_sayisi>15000);
                
 /* -----------------------------------------------------------------------------
  ORNEK2: sirket_id’si 101’den büyük olan þirket çalýþanlarýnýn isim, maaþ ve 
  þehirlerini listeleyiniz. 
 -----------------------------------------------------------------------------*/ 
 SELECT isim,maas,sehir FROM personel1
 WHERE sirket IN(SELECT sirket_adi
                  FROM sirketler
                  WHERE sirket_id>101);
 
 
 
/* -----------------------------------------------------------------------------
  ORNEK3:  Ankara’da personeli olan þirketlerin þirket id'lerini ve personel 
  sayýlarýný listeleyiniz 
 -----------------------------------------------------------------------------*/ 
 SELECT sirket_id, personel_sayisi FROM sirketler
 WHERE sirket_adi IN(SELECT sirket FROM personel1
                     WHERE sehir ='Ankara');
 
 
 
   
/* -----------------------------------------------------------------------------
  ORNEK4: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  toplam maaþýný listeleyen bir Sorgu yazýnýz.
 -------------------------------------------------------------*/
 SELECT sirket_adi, personel_sayisi,(SELECT SUM(maas) 
                                     FROM personel1
                                     WHERE personel1.sirket= sirketler.sirket_adi)AS toplam_maas
 FROM sirketler;
 
 
 
 
 
 /* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlarý(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanýlabilir.
    Ancak, Sorgu tek bir deðer döndüryor olmalýdýr.
==============================================================================*/ 

/* -----------------------------------------------------------------------------
  ORNEK5: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  ortalama maaþýný listeleyen bir Sorgu yazýnýz.
-----------------------------------------------------------------------------*/
 
 SELECT sirket_adi,personel_sayisi,(SELECT ROUND(AVG(maas)) FROM personel1
                                    WHERE sirket= sirketler.sirket_adi)AS ort_maas
 FROM sirketler;                                   
 

/* ----------------------------------------------------------------------------
  ORNEK6: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  maksimum ve minumum maaþýný listeleyen bir Sorgu yazýnýz.
 -----------------------------------------------------------------------------*/   
 SELECT sirket_adi, personel_sayisi, (SELECT MAX(maas)
                                    FROM personel1
                                    WHERE sirket_adi=sirket) AS max_maas,
                                    (SELECT MIN (maas)
                                    FROM personel1
                                    WHERE sirket_adi=sirket) AS min_maas
FROM sirketler;
 
                
/* -----------------------------------------------------------------------------
  ORNEK8: Her sirketin id’sini, ismini ve toplam kaç þehirde bulunduðunu 
  listeleyen bir SORGU yazýnýz.
 -------------------------------------------------------------------------*/
 SELECT sirket_id, sirket_adi,(SELECT COUNT(sehir) 
                                     FROM personel1
                                     WHERE sirket= sirketler.sirket_adi) AS sehir_sayisi
 FROM sirketler;
                