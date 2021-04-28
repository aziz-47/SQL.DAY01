/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadýðýný kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eðer aldýðý tüm ifadeler NULL ise NULL döndürürür.
    
    COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

  CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );
    
    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    
    DELETE FROM insanlar;
    
/* ----------------------------------------------------------------------------
  ORNEK1: isim ’i NULL olanlarý sorgulayýnýz.
-----------------------------------------------------------------------------*/

SELECT* FROM insanlar
WHERE isim IS NULL;

/* ----------------------------------------------------------------------------
  ORNEK1: isim ’i NULL olMAYANALRI sorgulayýnýz.
-----------------------------------------------------------------------------*/

SELECT* FROM insanlar
WHERE isim IS NOT NULL;

/* ----------------------------------------------------------------------------
  ORNEK1: isim ’i NULL olan kisileriin isimini NO NAME atayiniz
-----------------------------------------------------------------------------*/
  UPDATE ýnsanlar
  SET isim= 'NO NAME'
  WHERE isim IS NULL;
  
  /* ----------------------------------------------------------------------------
  ORNEK4:   isim ’i NULL olanlara ‘Henuz isim girilmedi’
            adres ’i NULL olanlara ‘Henuz adres girilmedi’
            ssn ’i NULL olanlara ‘Henuz ssn girilmedi’ atayalým.
-----------------------------------------------------------------------------*/
  
  UPDATE insanlar
  SET isim  = COALESCE(isim,'Henuz isim girilmedi'),
      adres = COALESCE(adres,'Adres henuz girilimedi'),
      ssn   = COALESCE(ssn,'No SSN');
