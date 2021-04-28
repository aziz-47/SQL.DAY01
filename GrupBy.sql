 /*============================= GROUP BY =====================================
    
    GROUP BY cümleciði bir SELECT ifadesinde satýrlarý, sutunlarýn deðerlerine 
    göre özet olarak gruplamak için kullanýlýr. 
   
    GROUP BY cümleceði her grup baþýna bir satýr döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlarý ile birlikte kullanýlýr.
    
==============================================================================*/

   CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
    
    /* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satýlan toplam meyve miktarlarýný gösteren sorguyu
  yazýnýz.
------------------------------------------------------------------------------*/
 SELECT isim, SUM(urun_miktari)AS toplam_urun
 FROM manav 
 GROUP BY isim;
 --Eger urunu miktarina gore sirlamak istersek asagdidkai kodu da yazabiiriz
 --ORDER BY SUM(urun_miktari);
 
 /* ----------------------------------------------------------------------------
  ORNEK2: satýlan meyve türüne (urun_adi) göre urun alan kiþi sayýsýný gösteren
  sorguyu yazýnýz. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
 --kosul varsa GRUOP BY ile bilikte WHERE cumlecigi kullanailabilir
 
 SELECT urun_adi,COUNT(isim) AS kisi_sayisi
 FROM manav
 WHERE urun_adi IS NOT NULL
 GROUP BY urun_adi;
 
 

  
    
    