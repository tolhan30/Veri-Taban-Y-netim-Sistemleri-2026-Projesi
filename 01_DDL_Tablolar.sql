-- 1. Veritabanını Oluşturma
CREATE DATABASE YemekSiparisDB;
GO

-- 2. Veritabanını Kullanmaya Başlama
USE YemekSiparisDB;
GO

-- ==========================================
-- 3. TABLOLARI OLUŞTURMA (DDL & Constraints)
-- ==========================================
-- Müşteriler Tablosu
CREATE TABLE Musteriler (
    MusteriID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon VARCHAR(15) UNIQUE NOT NULL, -- Tekrarlanamaz (UNIQUE) ve Boş Geçilemez (NOT NULL)
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Sifre NVARCHAR(50) NOT NULL,
    IhtiyacSahibiMi BIT DEFAULT 0, -- 1 ise Askıda Yemek havuzundan ücretsiz sipariş verebilir
    IsActive BIT DEFAULT 1 -- Soft Delete için. 1: Aktif, 0: Silinmiş (Pasif)
);
-- Restoranlar Tablosu
CREATE TABLE Restoranlar (
    RestoranID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranAdi NVARCHAR(100) NOT NULL,
    Adres NVARCHAR(255) NOT NULL,
    Telefon VARCHAR(15) UNIQUE,
    Puan DECIMAL(3,2) CHECK (Puan BETWEEN 1 AND 5), -- CHECK Constraint: Puan 1 ile 5 arasında olmalı
    ToplamCiro DECIMAL(10,2) DEFAULT 0,
    IsActive BIT DEFAULT 1
);
-- Kuryeler Tablosu
CREATE TABLE Kuryeler (
    KuryeID INT IDENTITY(1,1) PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Telefon VARCHAR(15) UNIQUE NOT NULL,
    AracTipi NVARCHAR(30) NOT NULL,
    IsActive BIT DEFAULT 1
);
-- Kategoriler Tablosu (Örn: Tatlılar, İçecekler)
CREATE TABLE Kategoriler (
    KategoriID INT IDENTITY(1,1) PRIMARY KEY,
    KategoriAdi NVARCHAR(50) NOT NULL UNIQUE,
    IsActive BIT DEFAULT 1
);
-- Ürünler (Menü) Tablosu
CREATE TABLE Urunler (
    UrunID INT IDENTITY(1,1) PRIMARY KEY,
    RestoranID INT FOREIGN KEY REFERENCES Restoranlar(RestoranID), -- FOREIGN KEY
    KategoriID INT FOREIGN KEY REFERENCES Kategoriler(KategoriID), -- FOREIGN KEY
    UrunAdi NVARCHAR(100) NOT NULL,
    Fiyat DECIMAL(10,2) CHECK (Fiyat > 0), -- CHECK Constraint: Fiyat 0'dan büyük olmalı
    IsActive BIT DEFAULT 1
);
-- Askıda Yemek Havuzu Bakiye Tablosu (Tek satırlık havuz)
CREATE TABLE AskidaYemekBakiye (
    BakiyeID INT PRIMARY KEY DEFAULT 1,
    GuncelBakiye DECIMAL(10,2) DEFAULT 0,
    ToplamBagislanan DECIMAL(10,2) DEFAULT 0,
    ToplamKullanilan DECIMAL(10,2) DEFAULT 0
);
-- Askıda Yemek Bağışları Tablosu
CREATE TABLE AskidaYemekBagislari (
    BagisID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID), -- NULL olabilir (Gizli bağışlar için)
    BagisMiktari DECIMAL(10,2) CHECK (BagisMiktari > 0),
    GizliMi BIT DEFAULT 0, -- 1 ise isim görünmez
    BagisTarihi DATETIME DEFAULT GETDATE()
);
-- Siparişler Tablosu
CREATE TABLE Siparisler (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    RestoranID INT FOREIGN KEY REFERENCES Restoranlar(RestoranID),
    KuryeID INT FOREIGN KEY REFERENCES Kuryeler(KuryeID), -- Sipariş ilk açıldığında NULL olabilir
    SiparisTarihi DATETIME DEFAULT GETDATE(),
    SiparisTutari DECIMAL(10,2) CHECK (SiparisTutari > 0), -- CHECK Constraint
    SiparisDurumu NVARCHAR(30) CHECK (SiparisDurumu IN ('Hazırlanıyor', 'Yolda', 'Teslim Edildi', 'İptal')),
    AskidaYemekKullanildiMi BIT DEFAULT 0, -- Sipariş havuzdan mı karşılandı?
    IsActive BIT DEFAULT 1
);
-- Sipariş Detayları Tablosu (Sepetteki ürünler)
CREATE TABLE SiparisDetaylari (
    DetayID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT FOREIGN KEY REFERENCES Siparisler(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urunler(UrunID),
    Adet INT CHECK (Adet > 0),
    BirimFiyat DECIMAL(10,2) CHECK (BirimFiyat > 0)
);
