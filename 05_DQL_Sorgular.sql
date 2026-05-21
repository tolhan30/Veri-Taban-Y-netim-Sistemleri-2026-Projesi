USE YemekSiparisDB;
GO

-- =======================================================
-- İLERİ DÜZEY SORGULAR (DQL) - (Öğretmeninin istediği formatta)
-- =======================================================

-- SORU 1: En az 3 tabloyu bağlayan detaylı sipariş fişi sorgusu (JOIN Kullanımı)
-- AÇIKLAMA: Müşteri, Sipariş, Kurye ve Restoran tablolarını birleştirerek 'Teslim Edilmiş' siparişlerin detaylı fişini getirir.
SELECT 
    S.SiparisID,
    M.Ad + ' ' + M.Soyad AS MusteriBilgisi,
    R.RestoranAdi,
    K.Ad + ' ' + K.Soyad AS KuryeBilgisi,
    S.SiparisTutari,
    S.SiparisTarihi
FROM Siparisler S
INNER JOIN Musteriler M ON S.MusteriID = M.MusteriID
INNER JOIN Restoranlar R ON S.RestoranID = R.RestoranID
LEFT JOIN Kuryeler K ON S.KuryeID = K.KuryeID
WHERE S.SiparisDurumu = 'Teslim Edildi';
GO

-- SORU 2: Agregasyon ve Gruplama (GROUP BY & HAVING)
-- AÇIKLAMA: Toplamda 5'ten fazla sipariş almış olan restoranların ortalama sepet tutarlarını, ciro toplamlarını ve sipariş sayılarını hesaplar.
SELECT 
    R.RestoranAdi,
    COUNT(S.SiparisID) AS ToplamSiparisAdedi,
    SUM(S.SiparisTutari) AS ToplamKazanilanTutar,
    AVG(S.SiparisTutari) AS OrtalamaSepetTutari
FROM Siparisler S
INNER JOIN Restoranlar R ON S.RestoranID = R.RestoranID
WHERE S.SiparisDurumu = 'Teslim Edildi'
GROUP BY R.RestoranAdi
HAVING COUNT(S.SiparisID) > 5;
GO

-- SORU 3: Alt Sorgu (Subquery) NOT EXISTS kullanımı
-- AÇIKLAMA: Hiç "Askıda Yemek" bağışı YAPMAMIŞ ama platformdan sipariş vermiş olan aktif müşterileri tespit eder.
SELECT 
    M.MusteriID, 
    M.Ad, 
    M.Soyad, 
    M.Email
FROM Musteriler M
WHERE M.IsActive = 1
  AND EXISTS (SELECT 1 FROM Siparisler S WHERE S.MusteriID = M.MusteriID)
  AND NOT EXISTS (SELECT 1 FROM AskidaYemekBagislari A WHERE A.MusteriID = M.MusteriID);
GO
