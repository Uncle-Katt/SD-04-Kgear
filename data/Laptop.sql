CREATE DATABASE LaptopK;
GO
USE LaptopK;
GO

-- Tạo bảng Vai trò (VaiTro)
CREATE TABLE [dbo].[VaiTro]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50) NOT NULL UNIQUE,
    [ten_vai_tro] VARCHAR(50) NOT NULL,
    [thu_tu]      INT         NOT NULL
);
GO

-- Tạo bảng Khách hàng (KhachHang)
CREATE TABLE [dbo].[KhachHang]
(
    [id]             INT IDENTITY (1,1) PRIMARY KEY,
    [ma]             VARCHAR(50)  NOT NULL UNIQUE,
    [ten_khach_hang] VARCHAR(255) NOT NULL,
    [email]          VARCHAR(255) NOT NULL UNIQUE,
    [so_dien_thoai]  VARCHAR(20)  NOT NULL,
    [dia_chi]        VARCHAR(255),
    [vai_tro_id]     INT,
    [ngay_tao]       DATETIME2 DEFAULT GETDATE(),
    [ngay_cap_nhat]  DATETIME2 DEFAULT GETDATE(),
    [thu_tu]         INT          NOT NULL,
    FOREIGN KEY ([vai_tro_id]) REFERENCES [dbo].[VaiTro] ([id])
);
GO

-- Tạo bảng Hãng sản xuất (HangSX)
CREATE TABLE [dbo].[HangSX]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50)  NOT NULL UNIQUE,
    [ten_hang_sx] VARCHAR(255) NOT NULL,
    [mo_ta]       TEXT,
    [thu_tu]      INT          NOT NULL
);
GO

-- Tạo bảng Màu sắc (MauSac)
CREATE TABLE [dbo].[MauSac]
(
    [id]      INT IDENTITY (1,1) PRIMARY KEY,
    [ma]      VARCHAR(50) NOT NULL UNIQUE,
    [ten_mau] VARCHAR(50) NOT NULL,
    [thu_tu]  INT         NOT NULL
);
GO

-- Tạo bảng Danh mục sản phẩm (DanhMuc)
CREATE TABLE [dbo].[DanhMuc]
(
    [id]           INT IDENTITY (1,1) PRIMARY KEY,
    [ma]           VARCHAR(50)  NOT NULL UNIQUE,
    [ten_danh_muc] VARCHAR(255) NOT NULL,
    [mo_ta]        TEXT,
    [thu_tu]       INT          NOT NULL
);
GO

-- Tạo bảng Sản phẩm laptop (Laptop)
CREATE TABLE [dbo].[Laptop]
(
    [id]                 INT IDENTITY (1,1) PRIMARY KEY,
    [ma]                 VARCHAR(50)    NOT NULL UNIQUE,
    [ten_laptop]         VARCHAR(255)   NOT NULL,
    [hang_sx_id]         INT            NOT NULL,
    [mau_sac_id]         INT            NOT NULL,
    [danh_muc_id]        INT            NOT NULL,
    [cpu]                NVARCHAR(100),
    [ram]                NVARCHAR(50),
    [o_cung]             NVARCHAR(50),
    [man_hinh]           NVARCHAR(50),
    [card_man_hinh]      NVARCHAR(50),
    [dung_luong_pin]     NVARCHAR(50),
    [he_dieu_hanh]       NVARCHAR(50),
    [thong_tin_bao_hanh] VARCHAR(255),
    [gia]                DECIMAL(10, 2) NOT NULL,
    [so_luong_ton_kho]   INT            NOT NULL,
    [mo_ta]              TEXT,
    [anh_url]            VARCHAR(255),
    [ngay_tao]           DATETIME2   DEFAULT GETDATE(),
    [ngay_cap_nhat]      DATETIME2   DEFAULT GETDATE(),
    [trang_thai]         VARCHAR(50) DEFAULT 'chua_ban',
    [thu_tu]             INT            NOT NULL,
    FOREIGN KEY ([hang_sx_id]) REFERENCES [dbo].[HangSX] ([id]),
    FOREIGN KEY ([mau_sac_id]) REFERENCES [dbo].[MauSac] ([id]),
    FOREIGN KEY ([danh_muc_id]) REFERENCES [dbo].[DanhMuc] ([id])
);
GO

-- Tạo bảng Đơn hàng (DonHang)
CREATE TABLE [dbo].[DonHang]
(
    [id]                     INT IDENTITY (1,1) PRIMARY KEY,
    [ma]                     VARCHAR(50)    NOT NULL UNIQUE,
    [khach_hang_id]          INT            NOT NULL,
    [ngay_dat]               DATETIME2   DEFAULT GETDATE(),
    [tong_tien]              DECIMAL(10, 2) NOT NULL,
    [dia_chi_giao_hang]      VARCHAR(255),
    [trang_thai]             VARCHAR(50) DEFAULT 'dang_xu_ly',
    [phuong_thuc_thanh_toan] VARCHAR(255),
    [ngay_tao]               DATETIME2   DEFAULT GETDATE(),
    [ngay_cap_nhat]          DATETIME2   DEFAULT GETDATE(),
    [thu_tu]                 INT            NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[KhachHang] ([id])
);
GO

-- Tạo bảng Chi tiết đơn hàng (ChiTietDonHang)
CREATE TABLE [dbo].[ChiTietDonHang]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50)    NOT NULL UNIQUE,
    [don_hang_id] INT            NOT NULL,
    [laptop_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   DECIMAL(10, 2) NOT NULL,
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([don_hang_id]) REFERENCES [dbo].[DonHang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[Laptop] ([id])
);
GO

-- Tạo bảng Giỏ hàng (GioHang)
CREATE TABLE [dbo].[GioHang]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [laptop_id]     INT         NOT NULL,
    [so_luong]      INT         NOT NULL,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [thu_tu]        INT         NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[KhachHang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[Laptop] ([id])
);
GO

-- Tạo bảng Giỏ hàng chi tiết (GioHangChiTiet)
CREATE TABLE [dbo].[GioHangChiTiet]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [gio_hang_id] INT            NOT NULL,
    [laptop_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   AS ([so_luong] * [gia]) PERSISTED,
    [ngay_tao]    DATETIME2 DEFAULT GETDATE(),
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([gio_hang_id]) REFERENCES [dbo].[GioHang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[Laptop] ([id])
);
GO

-- Tạo bảng Đánh giá sản phẩm (DanhGia)
CREATE TABLE [dbo].[DanhGia]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [laptop_id]     INT         NOT NULL,
    [diem_danh_gia] INT CHECK ([diem_danh_gia] >= 1 AND [diem_danh_gia] <= 5),
    [binh_luan]     TEXT,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [thu_tu]        INT         NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[KhachHang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[Laptop] ([id])
);
GO

-- Trigger tạo mã tự động cho Laptop với định dạng "LT+id"
CREATE TRIGGER trg_Laptop_Ma
    ON [dbo].[Laptop]
    AFTER INSERT
    AS
BEGIN
    UPDATE [dbo].[Laptop]
    SET [ma] = CONCAT('LT', [id])
    WHERE [id] IN (SELECT [id] FROM inserted);
END;
GO
