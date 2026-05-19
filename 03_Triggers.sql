USE YemekSiparisDB;
GO

-- 1. TRİGGER: Biri bağış yaptığında havuzdaki parayı otomatik artıran tetikleyici
CREATE TRIGGER trg_BagisYapildi
ON AskidaYemekBagislari
AFTER INSERT
AS
BEGIN
    DECLARE @Miktar DECIMAL(10,2);
    SELECT @Miktar = inserted.BagisMiktari FROM inserted;
    
    UPDATE AskidaYemekBakiye
    SET GuncelBakiye = GuncelBakiye + @Miktar,
        ToplamBagislanan = ToplamBagislanan + @Miktar
    WHERE BakiyeID = 1;
END;
GO

-- 2. TRİGGER: Askıda Yemek kullanan biri sipariş verdiğinde, sipariş tutarını anında havuzdan düşen tetikleyici
CREATE TRIGGER trg_AskidaYemekKullanildi
ON Siparisler
AFTER INSERT
AS
BEGIN
    UPDATE a
    SET a.GuncelBakiye = a.GuncelBakiye - i.SiparisTutari,
        a.ToplamKullanilan = a.ToplamKullanilan + i.SiparisTutari
    FROM AskidaYemekBakiye a
    INNER JOIN inserted i ON 1=1
    WHERE i.AskidaYemekKullanildiMi = 1;
END;
GO

-- 3. TRİGGER: Herhangi bir sipariş "Teslim Edildi" statüsüne geçtiğinde, restoranın Toplam Cirosunu artıran tetikleyici
CREATE TRIGGER trg_SiparisTeslimEdildiCiroGuncelle
ON Siparisler
AFTER UPDATE
AS
BEGIN
    -- Sadece sipariş durumu güncellendiyse ve yeni durum 'Teslim Edildi' ise çalışır
    IF UPDATE(SiparisDurumu)
    BEGIN
        UPDATE r
        SET r.ToplamCiro = r.ToplamCiro + i.SiparisTutari
        FROM Restoranlar r
        INNER JOIN inserted i ON r.RestoranID = i.RestoranID
        INNER JOIN deleted d ON i.SiparisID = d.SiparisID
        WHERE i.SiparisDurumu = 'Teslim Edildi' 
          AND d.SiparisDurumu <> 'Teslim Edildi';
    END
END;
GO
