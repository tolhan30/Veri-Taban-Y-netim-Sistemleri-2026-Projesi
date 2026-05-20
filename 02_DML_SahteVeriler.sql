USE YemekSiparisDB;
GO

-- 1. KATEGORİLER (5 Adet)
INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Burgerler'), ('Pizzalar'), ('Kebaplar'), ('İçecekler'), ('Tatlılar');
GO

-- 2. KURYELER (5 Adet)
INSERT INTO Kuryeler (Ad, Soyad, Telefon, AracTipi) VALUES 
('Ahmet', 'Hızlı', '05551112233', 'Motosiklet'),
('Mehmet', 'Uçar', '05552223344', 'Bisiklet'),
('Ali', 'Yılmaz', '05553334455', 'Motosiklet'),
('Veli', 'Demir', '05554445566', 'Otomobil'),
('Ayşe', 'Rüzgar', '05555556677', 'Motosiklet');
GO

-- 3. RESTORANLAR (5 Adet)
INSERT INTO Restoranlar (RestoranAdi, Adres, Telefon, Puan) VALUES 
('Burger King', 'Kadıköy Meydan', '02161112233', 4.5),
('Dominos Pizza', 'Beşiktaş Sahil', '02122223344', 4.2),
('Kasap Döner', 'Şişli Merkez', '02123334455', 4.8),
('Hafız Mustafa', 'Eminönü', '02124445566', 4.9),
('Kral Lahmacun', 'Üsküdar', '02165556677', 4.0);
GO

-- 4. MÜŞTERİLER (20 Adet: 15 Normal, 5 İhtiyaç Sahibi)
INSERT INTO Musteriler (Ad, Soyad, Telefon, Email, Sifre, IhtiyacSahibiMi) VALUES 
('Can', 'Öz', '05001002030', 'can@mail.com', '1234', 0),
('Eda', 'Gül', '05001002031', 'eda@mail.com', '1234', 0),
('Cem', 'Taş', '05001002032', 'cem@mail.com', '1234', 0),
('Oya', 'Ay', '05001002033', 'oya@mail.com', '1234', 0),
('Efe', 'Ak', '05001002034', 'efe@mail.com', '1234', 0),
('Nil', 'Su', '05001002035', 'nil@mail.com', '1234', 0),
('Ali', 'Can', '05001002036', 'ali@mail.com', '1234', 0),
('Ata', 'Er', '05001002037', 'ata@mail.com', '1234', 0),
('Bora', 'Uz', '05001002038', 'bora@mail.com', '1234', 0),
('Gök', 'Ay', '05001002039', 'gok@mail.com', '1234', 0),
('Han', 'Dağ', '05001002040', 'han@mail.com', '1234', 0),
('Ece', 'Gür', '05001002041', 'ece@mail.com', '1234', 0),
('Mert', 'Zor', '05001002042', 'mert@mail.com', '1234', 0),
('Nur', 'Işık', '05001002043', 'nur@mail.com', '1234', 0),
('Canan', 'Sön', '05001002044', 'canan@mail.com', '1234', 0),
-- İhtiyaç Sahipleri
('Zeki', 'Yok', '05001002045', 'zeki@mail.com', '1234', 1),
('Suna', 'Dar', '05001002046', 'suna@mail.com', '1234', 1),
('Vefa', 'Zor', '05001002047', 'vefa@mail.com', '1234', 1),
('Hale', 'Güz', '05001002048', 'hale@mail.com', '1234', 1),
('Tarık', 'Bol', '05001002049', 'tarik@mail.com', '1234', 1);
GO

-- 5. ÜRÜNLER (50 Adet: Her restorana 10 farklı ürün)
INSERT INTO Urunler (RestoranID, KategoriID, UrunAdi, Fiyat) VALUES 
(1, 1, 'Whopper', 120.00), (1, 1, 'Chicken Royale', 100.00), (1, 1, 'Big King', 130.00), (1, 1, 'Texas Smoke', 150.00), (1, 1, 'Steakhouse', 160.00),
(1, 1, 'Double Whopper', 180.00), (1, 1, 'Köfteburger', 90.00), (1, 4, 'Kola', 30.00), (1, 4, 'Ayran', 20.00), (1, 4, 'Buzlu Çay', 35.00),
(2, 2, 'Margarita', 140.00), (2, 2, 'Karışık Pizza', 180.00), (2, 2, 'Sucuklu Pizza', 160.00), (2, 2, 'Bol Malzemos', 200.00), (2, 2, 'Tavuklu Pizza', 170.00),
(2, 2, 'Meksika Ateşi', 190.00), (2, 2, 'Akdeniz Pizza', 150.00), (2, 4, 'Kola', 30.00), (2, 4, 'Fanta', 30.00), (2, 4, 'Sprite', 30.00),
(3, 3, 'Et Döner Dürüm', 150.00), (3, 3, 'Tavuk Döner', 100.00), (3, 3, 'İskender', 250.00), (3, 3, 'Porsiyon Döner', 220.00), (3, 3, 'Pilav Üstü Et', 200.00),
(3, 3, 'Pilav Üstü Tavuk', 140.00), (3, 3, 'Tombik Döner', 160.00), (3, 4, 'Yayık Ayran', 30.00), (3, 4, 'Şalgam', 25.00), (3, 4, 'Su', 10.00),
(4, 5, 'Fıstıklı Baklava', 300.00), (4, 5, 'Cevizli Baklava', 250.00), (4, 5, 'Sütlaç', 80.00), (4, 5, 'Kazandibi', 75.00), (4, 5, 'Tavuk Göğsü', 75.00),
(4, 5, 'Trileçe', 90.00), (4, 5, 'Künefe', 120.00), (4, 4, 'Türk Kahvesi', 50.00), (4, 4, 'Çay', 20.00), (4, 4, 'Limonata', 40.00),
(5, 3, 'Acılı Lahmacun', 50.00), (5, 3, 'Acısız Lahmacun', 50.00), (5, 3, 'Kıymalı Pide', 130.00), (5, 3, 'Kuşbaşılı Pide', 150.00), (5, 3, 'Kaşarlı Pide', 120.00),
(5, 3, 'Karışık Pide', 160.00), (5, 3, 'Adana Kebap', 200.00), (5, 3, 'Urfa Kebap', 200.00), (5, 4, 'Ayran', 20.00), (5, 4, 'Şalgam', 25.00);
GO

-- Havuzu Başlatmak İçin Bakiye Tablosuna İlk Sıfır Kaydını Atıyoruz
INSERT INTO AskidaYemekBakiye (BakiyeID, GuncelBakiye, ToplamBagislanan, ToplamKullanilan) 
VALUES (1, 0, 0, 0);
GO

-- 6. ASKIDA YEMEK BAĞIŞLARI (Bu işlem Trigger'ı çalıştırıp Bakiye tablosundaki parayı artıracaktır)
INSERT INTO AskidaYemekBagislari (MusteriID, BagisMiktari, GizliMi) VALUES 
(1, 500.00, 0),     -- Can 500 TL bağışladı
(2, 1000.00, 1),    -- Eda 1000 TL bağışladı (Gizli)
(3, 250.00, 0),     -- Cem 250 TL bağışladı
(NULL, 1250.00, 1), -- Anonim biri 1250 TL bağışladı
(5, 2000.00, 0);    -- Efe 2000 TL bağışladı (TOPLAM HAVUZ: 5000 TL)
GO

-- 7. 100 ADET SİPARİŞİ VE DETAYINI OLUŞTURAN DÖNGÜ (WHILE LOOP)
DECLARE @i INT = 1;
DECLARE @MusteriID INT, @RestoranID INT, @KuryeID INT, @UrunID INT, @Adet INT, @Fiyat DECIMAL(10,2), @Tutar DECIMAL(10,2), @AskidaMi BIT;
WHILE @i <= 100
BEGIN
    SET @MusteriID = (ABS(CHECKSUM(NEWID())) % 20) + 1;
    SET @RestoranID = (ABS(CHECKSUM(NEWID())) % 5) + 1;
    SET @KuryeID = (ABS(CHECKSUM(NEWID())) % 5) + 1;
    
    SET @AskidaMi = 0;
    -- Eğer seçilen müşteri İhtiyaç Sahibi ise rastgele bir şekilde Askıda Yemek kullansın
    IF EXISTS(SELECT 1 FROM Musteriler WHERE MusteriID = @MusteriID AND IhtiyacSahibiMi = 1)
    BEGIN
        IF (ABS(CHECKSUM(NEWID())) % 2) = 1 SET @AskidaMi = 1;
    END
    -- Restoranın menüsünden rastgele 1 ürün seç
    SELECT TOP 1 @UrunID = UrunID, @Fiyat = Fiyat FROM Urunler WHERE RestoranID = @RestoranID ORDER BY NEWID();
    
    SET @Adet = (ABS(CHECKSUM(NEWID())) % 3) + 1; -- 1, 2 veya 3 adet
    SET @Tutar = @Fiyat * @Adet;
    -- Siparişi ekle
    INSERT INTO Siparisler (MusteriID, RestoranID, KuryeID, SiparisTutari, SiparisDurumu, AskidaYemekKullanildiMi)
    VALUES (@MusteriID, @RestoranID, @KuryeID, @Tutar, 'Hazırlanıyor', @AskidaMi);
    DECLARE @YeniSiparisID INT = SCOPE_IDENTITY();
    -- Sipariş detayını ekle
    INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, BirimFiyat)
    VALUES (@YeniSiparisID, @UrunID, @Adet, @Fiyat);
    SET @i = @i + 1;
END;
GO

-- 8. TRİGGER TESTİ: 100 siparişin 80 tanesini 'Teslim Edildi' yapıyoruz.
-- Bu işlem "Ciro Güncelleme" Trigger'ını ateşleyecek ve Restoranların "ToplamCiro" kolonu artacaktır.
UPDATE Siparisler 
SET SiparisDurumu = 'Teslim Edildi'
WHERE SiparisID <= 80;
GO

-- 9. SOFT DELETE (Pasife Çekme) ÖRNEĞİ
-- Burger King menüsündeki 'Whopper' ürününü (UrunID = 1) satımdan kaldıralım (Silmek yerine IsActive = 0 yapıyoruz)
UPDATE Urunler 
SET IsActive = 0 
WHERE UrunID = 1;
GO
