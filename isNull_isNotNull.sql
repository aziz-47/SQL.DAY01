/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operat�rleridir. Bir ifadenin NULL olup 
    olmad���n� kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve i�erisindeki parameterelerden NULL olmayan
    ilk ifadeyi d�nd�r�r. E�er ald��� t�m ifadeler NULL ise NULL d�nd�r�r�r.
    
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
  ORNEK1: isim �i NULL olanlar� sorgulay�n�z.
-----------------------------------------------------------------------------*/

SELECT* FROM insanlar
WHERE isim IS NULL;

/* ----------------------------------------------------------------------------
  ORNEK1: isim �i NULL olMAYANALRI sorgulay�n�z.
-----------------------------------------------------------------------------*/

SELECT* FROM insanlar
WHERE isim IS NOT NULL;

/* ----------------------------------------------------------------------------
  ORNEK1: isim �i NULL olan kisileriin isimini NO NAME atayiniz
-----------------------------------------------------------------------------*/
  UPDATE �nsanlar
  SET isim= 'NO NAME'
  WHERE isim IS NULL;
  
  /* ----------------------------------------------------------------------------
  ORNEK4:   isim �i NULL olanlara �Henuz isim girilmedi�
            adres �i NULL olanlara �Henuz adres girilmedi�
            ssn �i NULL olanlara �Henuz ssn girilmedi� atayal�m.
-----------------------------------------------------------------------------*/
  
  UPDATE insanlar
  SET isim  = COALESCE(isim,'Henuz isim girilmedi'),
      adres = COALESCE(adres,'Adres henuz girilimedi'),
      ssn   = COALESCE(ssn,'No SSN');
