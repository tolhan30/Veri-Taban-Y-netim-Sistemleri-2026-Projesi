USE YemekSiparisDB;
GO

-- =======================================================
-- GÖRÜNÜMLER (VIEWS)
-- =======================================================
-- View 1: Karmaşık havuz durumunu tek tıkla görebilmek için basite indirgeyen görünüm
CREATE VIEW vw_AskidaYemekHavuzDurumu AS
SELECT 
    GuncelBakiye AS [Mevcut Bakiye (TL)], 
    ToplamBagislanan AS [Gelen Toplam Bagis], 
    ToplamKullanilan AS [Ihtiyac Sahiplerinin Kullandigi]
FROM AskidaYemekBakiye;
GO

-- View 2: Sadece aktif olan ürünleri, kategori ve restoranlarıyla birlikte getiren görünüm
CREATE VIEW vw_AktifRestoranMenuleri AS
SELECT 
    R.RestoranAdi, 
    K.KategoriAdi, 
    U.UrunAdi, 
    U.Fiyat
FROM Urunler U
INNER JOIN Restoranlar R ON U.RestoranID = R.RestoranID
INNER JOIN Kategoriler K ON U.KategoriID = K.KategoriID
WHERE U.IsActive = 1 AND R.IsActive = 1;
GO

-- =======================================================
-- İNDEKSLEME (INDEXES)
-- =======================================================
-- Index 1: Sipariş durumlarına göre (Hazırlanıyor, Teslim Edildi vb.) çok sık arama yapılacağı için hızlandırma sağlar
CREATE NONCLUSTERED INDEX IX_Siparisler_Durum 
ON Siparisler(SiparisDurumu);
GO

-- Index 2: Ürünlerin aktif/pasif durumuna göre hızlı filtreleme yapmak için
CREATE NONCLUSTERED INDEX IX_Urunler_IsActive 
ON Urunler(IsActive);
GO
