/*================================ ORDER BY  ===================================
   ORDER BY cümleciði bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanýlýr.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/

   CREATE TABLE kisiler 
    (
        ssn char(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');
    
    SELECT* FROM kisiler;
    
 /* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres’e göre sýralayarak sorgulayýnýz.
-----------------------------------------------------------------------------*/
    SELECT* FROM kisiler
    ORDER BY adres;    --ASC gibi siraladi
    
  
     
 /* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres’e göre sýralayarak sorgulayýnýz.
-----------------------------------------------------------------------------*/
SELECT* FROM kisiler
ORDER BY maas;

/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres’e göre AZALAN  sýrada sorgulayýnýz.
-----------------------------------------------------------------------------*/
SELECT* FROM kisiler
ORDER BY maas DESC;--AZALAN

 /*----------------------------------------------------------------------------
  ORNEK4: Soyismi Bulut olanlarý, isim sirali olarak siralayiniz
-----------------------------------------------------------------------------*/
    SELECT* FROM kisiler
    WHERE soyisim ='Bulut'
    ORDER BY 2;             -- isme gore sirlanmis
    
    
          
/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleciði ile listelenecek kayýtlarý sýnýrlandýrabiliriz. Ýstersek 
   satýr sayýsýna göre istersek de toplam satýr sayýsýnýn belli bir yüzdesine 
   göre sýnýrlandýrma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleciði ile de listenecek olan satýrlardan sýrasýyla istediðimiz 
   kadarýný atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satýr_sayisi ROWS;
  
==============================================================================*/ 
    
    
    
   /* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ’ý en yüksek 3 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/ 

 SELECT* FROM kisiler
 ORDER BY maas DESC
 FETCH NEXT 3 ROWS ONLY;
 
  /* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ’ý en dusuk 2 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/ 
 SELECT* FROM kisiler
 ORDER BY maas ASC
 FETCH NEXT 2 ROWS ONLY;
 
 /* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ’ý en dusuk 4 IEL 6. arasidanki  kiþilerin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
--Bu soruda ofset kullanacagiz

 SELECT* FROM kisiler
 ORDER BY maas DESC
 OFFSET 3 ROWS             ---OFFSET ile ilk 3 kaydi rowu atladik
 FETCH NEXT 3 ROWS ONLY;   ---FETH NEXT ile sonraki 3 kaydi sectik
 

 /*============================= GROUP BY =====================================
    
    GROUP BY cümleciði bir SELECT ifadesinde satýrlarý, sutunlarýn deðerlerine 
    göre özet olarak gruplamak için kullanýlýr. 
   
    GROUP BY cümleceði her grup baþýna bir satýr döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlarý ile birlikte kullanýlýr.
    
==============================================================================*/


    
    
  