/*================================ ORDER BY  ===================================
   ORDER BY c�mleci�i bir SORGU deyimi i�erisinde belli bir SUTUN�a g�re 
   SIRALAMA yapmak i�in kullan�l�r.
   
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
  ORNEK1: kisiler tablosunu adres�e g�re s�ralayarak sorgulay�n�z.
-----------------------------------------------------------------------------*/
    SELECT* FROM kisiler
    ORDER BY adres;    --ASC gibi siraladi
    
  
     
 /* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres�e g�re s�ralayarak sorgulay�n�z.
-----------------------------------------------------------------------------*/
SELECT* FROM kisiler
ORDER BY maas;

/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres�e g�re AZALAN  s�rada sorgulay�n�z.
-----------------------------------------------------------------------------*/
SELECT* FROM kisiler
ORDER BY maas DESC;--AZALAN

 /*----------------------------------------------------------------------------
  ORNEK4: Soyismi Bulut olanlar�, isim sirali olarak siralayiniz
-----------------------------------------------------------------------------*/
    SELECT* FROM kisiler
    WHERE soyisim ='Bulut'
    ORDER BY 2;             -- isme gore sirlanmis
    
    
          
/*====================== FETCH NEXT, OFFSET (12C VE �ST�) ======================
   FETCH c�mleci�i ile listelenecek kay�tlar� s�n�rland�rabiliriz. �stersek 
   sat�r say�s�na g�re istersek de toplam sat�r say�s�n�n belli bir y�zdesine 
   g�re s�n�rland�rma koymak m�mk�nd�r. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET C�mleci�i ile de listenecek olan sat�rlardan s�ras�yla istedi�imiz 
   kadar�n� atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET sat�r_sayisi ROWS;
  
==============================================================================*/ 
    
    
    
   /* ----------------------------------------------------------------------------
  ORNEK1: MAAޒ� en y�ksek 3 ki�inin bilgilerini listeleyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/ 

 SELECT* FROM kisiler
 ORDER BY maas DESC
 FETCH NEXT 3 ROWS ONLY;
 
  /* ----------------------------------------------------------------------------
  ORNEK1: MAAޒ� en dusuk 2 ki�inin bilgilerini listeleyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/ 
 SELECT* FROM kisiler
 ORDER BY maas ASC
 FETCH NEXT 2 ROWS ONLY;
 
 /* ----------------------------------------------------------------------------
  ORNEK1: MAAޒ� en dusuk 4 IEL 6. arasidanki  ki�ilerin bilgilerini listeleyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
--Bu soruda ofset kullanacagiz

 SELECT* FROM kisiler
 ORDER BY maas DESC
 OFFSET 3 ROWS             ---OFFSET ile ilk 3 kaydi rowu atladik
 FETCH NEXT 3 ROWS ONLY;   ---FETH NEXT ile sonraki 3 kaydi sectik
 

 /*============================= GROUP BY =====================================
    
    GROUP BY c�mleci�i bir SELECT ifadesinde sat�rlar�, sutunlar�n de�erlerine 
    g�re �zet olarak gruplamak i�in kullan�l�r. 
   
    GROUP BY c�mlece�i her grup ba��na bir sat�r d�nd�r�r. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlar� ile birlikte kullan�l�r.
    
==============================================================================*/


    
    
  