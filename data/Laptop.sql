CREATE DATABASE LaptopK;
GO
USE LaptopK;
GO

-- Tạo bảng Vai trò (VaiTro)
CREATE TABLE [dbo].[vai_tro]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50) NOT NULL UNIQUE,
    [ten_vai_tro] NVARCHAR(50) NOT NULL,
    [thu_tu]      INT         NOT NULL
    );
GO

-- Tạo bảng khách hàng (khach_hang)
CREATE TABLE [dbo].[khach_hang]
(
    [id]             INT IDENTITY (1,1) PRIMARY KEY,
    [ma]             VARCHAR(50)  NOT NULL UNIQUE,
    [ten_khach_hang] NVARCHAR(255) NOT NULL,
    [email]          NVARCHAR(255) NOT NULL UNIQUE,
    [so_dien_thoai]  VARCHAR(20)  NOT NULL,
    [dia_chi]        NVARCHAR(255),
    [ngay_tao]       DATETIME2 DEFAULT GETDATE(),
    [ngay_cap_nhat]  DATETIME2 DEFAULT GETDATE(),
    [thu_tu]         INT          NOT NULL,
    );
GO

-- Tạo bảng nhân viên (nhan_vien)
CREATE TABLE [dbo].[nhan_vien]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [ten_nhan_vien] NVARCHAR(255) NOT NULL,
    [email]         NVARCHAR(255) NOT NULL UNIQUE,
    [so_dien_thoai] VARCHAR(20) NOT NULL,
    [dia_chi]       NVARCHAR(255),
    [vai_tro_id]    INT NOT NULL,
    [username]      VARCHAR(50) NOT NULL UNIQUE,
    [password]      VARCHAR(255) NOT NULL,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [ngay_cap_nhat] DATETIME2 DEFAULT GETDATE(),
    [thu_tu]       INT NOT NULL,
    FOREIGN KEY ([vai_tro_id]) REFERENCES [dbo].[vai_tro] ([id])
    );
GO

-- Tạo bảng hãng sản xuất (hang_sx)
CREATE TABLE [dbo].[hang_sx]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50)  NOT NULL UNIQUE,
    [ten_hang_sx] NVARCHAR(255) NOT NULL,
    [mo_ta]       NTEXT,
    [thu_tu]      INT          NOT NULL
    );
GO

-- Tạo bảng màu sắc (mau_sac)
CREATE TABLE [dbo].[mau_sac]
(
    [id]      INT IDENTITY (1,1) PRIMARY KEY,
    [ma]      VARCHAR(50) NOT NULL UNIQUE,
    [ten_mau] NVARCHAR(50) NOT NULL,
    [thu_tu]  INT         NOT NULL
    );
GO

-- Tạo bảng danh mục sản phẩm (danh_muc)
CREATE TABLE [dbo].[danh_muc]
(
    [id]           INT IDENTITY (1,1) PRIMARY KEY,
    [ma]           VARCHAR(50)  NOT NULL UNIQUE,
    [ten_danh_muc] NVARCHAR(255) NOT NULL,
    [mo_ta]        NTEXT,
    [thu_tu]       INT          NOT NULL
    );
GO

-- Tạo bảng laptop (laptop)
CREATE TABLE [dbo].[laptop]
(
    [id] INT IDENTITY(1,1) PRIMARY KEY,
    [ten] NVARCHAR(255) NOT NULL,
    [mo_ta] NTEXT,
    [gia] DECIMAL(10, 2) NOT NULL,
    [so_luong] INT NOT NULL,
    [anh_url] VARCHAR(255)
    );
GO

-- Tạo bảng chi tiết laptop (chi_tiet_laptop)
CREATE TABLE [dbo].[chi_tiet_laptop]
(
    [id]                 INT IDENTITY (1,1) PRIMARY KEY,
    [ma]                 VARCHAR(50)    NOT NULL UNIQUE,
    [laptop_id]         INT            NOT NULL,
    [hang_sx_id]        INT            NOT NULL,
    [mau_sac_id]        INT            NOT NULL,
    [danh_muc_id]       INT            NOT NULL,
    [cpu]               NVARCHAR(100),
    [ram]               NVARCHAR(50),
    [o_cung]            NVARCHAR(50),
    [man_hinh]          NVARCHAR(50),
    [card_man_hinh]     NVARCHAR(50),
    [dung_luong_pin]    NVARCHAR(50),
    [he_dieu_hanh]      NVARCHAR(50),
    [thong_tin_bao_hanh] NVARCHAR(255),
    [gia]               DECIMAL(10, 2) NOT NULL,
    [so_luong_ton_kho]  INT            NOT NULL,
    [mo_ta]             NTEXT,
    [anh_url]           VARCHAR(255),
    [ngay_tao]          DATETIME2   DEFAULT GETDATE(),
    [ngay_cap_nhat]     DATETIME2   DEFAULT GETDATE(),
    [trang_thai]        VARCHAR(50) DEFAULT 'chua_ban',
    [thu_tu]            INT            NOT NULL,
    FOREIGN KEY ([hang_sx_id]) REFERENCES [dbo].[hang_sx] ([id]),
    FOREIGN KEY ([mau_sac_id]) REFERENCES [dbo].[mau_sac] ([id]),
    FOREIGN KEY ([danh_muc_id]) REFERENCES [dbo].[danh_muc] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO

-- Tạo bảng đơn hàng (don_hang)
CREATE TABLE [dbo].[don_hang]
(
    [id]                     INT IDENTITY (1,1) PRIMARY KEY,
    [ma]                     VARCHAR(50)    NOT NULL UNIQUE,
    [khach_hang_id]          INT            NOT NULL,
    [ngay_dat]               DATETIME2   DEFAULT GETDATE(),
    [tong_tien]              DECIMAL(10, 2) NOT NULL,
    [dia_chi_giao_hang]      NVARCHAR(255),
    [trang_thai]             VARCHAR(50) DEFAULT 'dang_xu_ly',
    [phuong_thuc_thanh_toan] NVARCHAR(255),
    [ngay_tao]               DATETIME2   DEFAULT GETDATE(),
    [ngay_cap_nhat]          DATETIME2   DEFAULT GETDATE(),
    [thu_tu]                 INT            NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[khach_hang] ([id])
    );
GO

-- Tạo bảng chi tiết đơn hàng (chi_tiet_don_hang)
CREATE TABLE [dbo].[chi_tiet_don_hang]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [ma]          VARCHAR(50)    NOT NULL UNIQUE,
    [don_hang_id] INT            NOT NULL,
    [laptop_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   DECIMAL(10, 2) NOT NULL,
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([don_hang_id]) REFERENCES [dbo].[don_hang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO

-- Tạo bảng giỏ hàng (gio_hang)
CREATE TABLE [dbo].[gio_hang]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [laptop_id]     INT         NOT NULL,
    [so_luong]      INT         NOT NULL,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [thu_tu]        INT         NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[khach_hang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO

-- Tạo bảng giỏ hàng chi tiết (gio_hang_chi_tiet)
CREATE TABLE [dbo].[gio_hang_chi_tiet]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [gio_hang_id] INT            NOT NULL,
    [laptop_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   AS ([so_luong] * [gia]) PERSISTED,
    [ngay_tao]    DATETIME2 DEFAULT GETDATE(),
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([gio_hang_id]) REFERENCES [dbo].[gio_hang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO

-- Tạo bảng đánh giá sản phẩm (danh_gia)
CREATE TABLE [dbo].[danh_gia]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [laptop_id]     INT         NOT NULL,
    [diem_danh_gia] INT CHECK ([diem_danh_gia] >= 1 AND [diem_danh_gia] <= 5),
    [binh_luan]     NTEXT,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [thu_tu]        INT         NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[khach_hang] ([id]),
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO

-- Tạo bảng series laptop (series_laptop)
CREATE TABLE [dbo].[series_laptop]
(
    [id]        INT IDENTITY (1,1) PRIMARY KEY,
    [laptop_id] INT            NOT NULL,
    [series]    VARCHAR(50)    NOT NULL,
    [ngay_tao]  DATETIME2   DEFAULT GETDATE(),
    [thu_tu]    INT            NOT NULL,
    FOREIGN KEY ([laptop_id]) REFERENCES [dbo].[laptop] ([id])
    );
GO


---- Trigger tạo mã tự động cho Laptop với định dạng "LT+id"
--CREATE TRIGGER trg_Laptop_Ma
--    ON [dbo].[laptop]
--    AFTER INSERT
--    AS
--BEGIN
--    UPDATE [dbo].[laptop]
--    SET [ma] = CONCAT('LT', [id])
--    WHERE [id] IN (SELECT [id] FROM inserted);
--END;
--GO

-- Thêm dữ liệu vào bảng vai_tro
INSERT INTO [dbo].[vai_tro] ([ma], [ten_vai_tro], [thu_tu])
VALUES
(N'AD', N'Quản trị viên', 1),
(N'NV', N'Nhân viên', 2),
(N'KH', N'Khách hàng', 3);

-- Thêm dữ liệu vào bảng khach_hang
INSERT INTO [dbo].[khach_hang] ([ma], [ten_khach_hang], [email], [so_dien_thoai], [dia_chi], [thu_tu])
VALUES
    (N'KH001', N'Nguyễn Văn A', N'email1@example.com', N'0123456789', N'Số 1, đường ABC', 1),
    (N'KH002', N'Trần Thị B', N'email2@example.com', N'0123456790', N'Số 2, đường DEF', 2),
    (N'KH003', N'Nguyễn Hoàng C', N'email3@example.com', N'0123456791', N'Số 3, đường XYZ', 3);

-- Thêm dữ liệu vào bảng nhan_vien
INSERT INTO [dbo].[nhan_vien] ([ma], [ten_nhan_vien], [email], [so_dien_thoai], [dia_chi], [vai_tro_id], [username], [password], [thu_tu])
VALUES
    ('NV001', 'Nguyễn Văn A', 'nva@example.com', '0123456789', 'Hà Nội', 1, 'nva', 'password1', 1),
    ('NV002', 'Trần Thị B', 'ttb@example.com', '0987654321', 'TP.HCM', 2, 'ttb', 'password2', 2),
    ('NV003', 'Lê Văn C', 'lvc@example.com', '0912345678', 'Đà Nẵng', 3, 'lvc', 'password3', 3);
GO

-- Thêm dữ liệu vào bảng hang_sx
INSERT INTO [dbo].[hang_sx] ([ma], [ten_hang_sx], [mo_ta], [thu_tu])
VALUES
(N'HP', N'Hewlett Packard', N'Máy tính của hãng HP', 1),
(N'DELL', N'Dell Technologies', N'Máy tính của hãng Dell', 2),
(N'LENOVO', N'Lenovo Group', N'Máy tính của hãng Lenovo', 3);

-- Thêm dữ liệu vào bảng mau_sac
INSERT INTO [dbo].[mau_sac] ([ma], [ten_mau], [thu_tu])
VALUES
    (N'XANH', N'Màu xanh', 1),
    (N'DO', N'Màu đỏ', 2),
    (N'VANG', N'Màu vàng', 3);

-- Thêm dữ liệu vào bảng danh_muc
INSERT INTO [dbo].[danh_muc] ([ma], [ten_danh_muc], [mo_ta], [thu_tu])
VALUES
    (N'DM001', N'Laptop Văn phòng', N'Laptop cho công việc văn phòng', 1),
    (N'DM002', N'Laptop Gaming', N'Laptop chuyên dụng cho chơi game', 2),
    (N'D003', N'Laptop Siêu nhẹ', N'Laptop nhẹ và dễ mang theo', 3);

-- Thêm dữ liệu vào bảng laptop
INSERT INTO [dbo].[laptop] ([ten], [mo_ta], [gia], [so_luong], [anh_url])
VALUES
    (N'Laptop HP 123', N'Một chiếc laptop HP mạnh mẽ với Intel Core i7', 10000, 10, 'url_to_image_1.jpg'),
    (N'Laptop Dell XPS', N'Một chiếc laptop Dell XPS mỏng nhẹ với Intel Core i5', 20000, 5, 'url_to_image_2.jpg'),
    (N'Laptop Lenovo ThinkPad', N'Một chiếc laptop Lenovo ThinkPad bền bỉ với AMD Ryzen 7', 15000, 7, 'url_to_image_3.jpg');
GO

-- Thêm dữ liệu vào bảng chi_tiet_lap_top
INSERT INTO [dbo].[chi_tiet_laptop] ([ma], [hang_sx_id], [mau_sac_id], [danh_muc_id], [cpu], [ram], [o_cung], [man_hinh], [card_man_hinh], [dung_luong_pin], [he_dieu_hanh], [gia], [so_luong_ton_kho], [mo_ta], [anh_url], [thu_tu])
VALUES
(N'LT001', 1, 1, 1, 'Intel Core i7', '16GB', '512GB SSD', '15.6"', 'NVIDIA GTX 1650', '56Wh', 'Windows 10', 10000, 10, N'Mô tả chi tiết cho Laptop HP 123', 'url_to_image_1_detail.jpg', 1),
(N'LT002', 2, 2, 2, 'Intel Core i5', '8GB', '256GB SSD', '15.6"', 'Intel UHD Graphics', '45Wh', 'Windows 11', 20000, 5, N'Mô tả chi tiết cho Laptop Dell XPS', 'url_to_image_2_detail.jpg', 2),
(N'LT003', 3, 3, 3, 'AMD Ryzen 7', '32GB', '1TB SSD', '17"', 'NVIDIA RTX 3060', '90Wh', 'Windows 11', 15000, 7, N'Mô tả chi tiết cho Laptop Lenovo ThinkPad', 'url_to_image_3_detail.jpg', 3);
GO

-- Thêm dữ liệu vào bảng don_hang
INSERT INTO [dbo].[don_hang] ([ma], [khach_hang_id], [tong_tien], [dia_chi_giao_hang], [phuong_thuc_thanh_toan], [thu_tu])
VALUES
(N'DH001', 1, 10000, N'Số 1, đường ABC', N'Trực tuyến', 1),
(N'DH002', 2, 20000, N'Số 2, đường DEF', N'Tiền mặt', 2),
(N'DH003', 3, 15000, N'Số 3, đường XYZ', N'Trực tuyến', 3);

-- Thêm dữ liệu vào bảng chi_tiet_don_hang
INSERT INTO [dbo].[chi_tiet_don_hang] ([ma], [don_hang_id], [laptop_id], [so_luong], [gia], [tong_tien], [thu_tu])
VALUES
    (N'CTDH001', 1, 1, 1, 10000, 10000, 1),
    (N'CTDH002', 2, 2, 1, 20000, 20000, 2),
    (N'CTDH003', 3, 3, 1, 15000, 15000, 3);

-- Thêm dữ liệu vào bảng gio_hang
INSERT INTO [dbo].[gio_hang] ([ma], [khach_hang_id], [laptop_id], [so_luong], [thu_tu])
VALUES
    (N'GH001', 1, 1, 1, 1),
    (N'GH002', 2, 2, 2, 2),
    (N'GH003', 3, 3, 1, 3);

-- Thêm dữ liệu vào bảng gio_hang_chi_tiet
INSERT INTO [dbo].[gio_hang_chi_tiet]
([gio_hang_id], [laptop_id], [so_luong], [gia], [thu_tu])
VALUES
    (1, 1, 3, 15000, 1),
    (1, 2, 2, 20000, 2),
    (1, 3, 1, 25000, 3);
SELECT id FROM dbo.laptop;

-- Thêm dữ liệu vào bảng danh_gia
INSERT INTO [dbo].[danh_gia] ([ma], [khach_hang_id], [laptop_id], [diem_danh_gia], [binh_luan], [thu_tu])
VALUES
    (N'DG001', 1, 1, 5, N'Rất tốt', 1),
    (N'DG002', 2, 2, 4, N'Tốt', 2),
    (N'DG003', 3, 3, 3, N'Bình thường', 3);

-- Thêm dữ liệu vào bảng series_laptop
INSERT INTO [dbo].[series_laptop] ([laptop_id], [series], [thu_tu])
VALUES
    (1, N'Series A', 1),
    (2, N'Series B', 2),
    (3, N'Series C', 3);

SELECT * FROM [dbo].[vai_tro];
SELECT * FROM [dbo].[khach_hang];
SELECT * FROM [dbo].[hang_sx];
SELECT * FROM [dbo].[mau_sac];
SELECT * FROM [dbo].[danh_muc];
SELECT * FROM [dbo].[laptop];
SELECT * FROM [dbo].[chi_tiet_laptop];
SELECT * FROM [dbo].[don_hang];
SELECT * FROM [dbo].[chi_tiet_don_hang];
SELECT * FROM [dbo].[gio_hang];
SELECT * FROM [dbo].[gio_hang_chi_tiet];
SELECT * FROM [dbo].[danh_gia];
SELECT * FROM [dbo].[series_laptop];


--DELETE FROM [dbo].[vai_tro];
--DELETE FROM [dbo].[khach_hang];
--DELETE FROM [dbo].[hang_sx];
--DELETE FROM [dbo].[mau_sac];
--DELETE FROM [dbo].[danh_muc];
--DELETE FROM [dbo].[laptop];
--DELETE FROM [dbo].[don_hang];
--DELETE FROM [dbo].[chi_tiet_don_hang];
--DELETE FROM [dbo].[gio_hang];
--DELETE FROM [dbo].[gio_hang_chi_tiet];
--DELETE FROM [dbo].[danh_gia];
--DELETE FROM [dbo].[series_laptop];

--DECLARE @table_name NVARCHAR(255)
--DECLARE @sql NVARCHAR(MAX)

---- Cursor để lặp qua tất cả các bảng có cột IDENTITY
--DECLARE table_cursor CURSOR FOR
--SELECT t.name
--FROM sys.tables t
--INNER JOIN sys.columns c ON t.object_id = c.object_id
--WHERE c.is_identity = 1  -- Chỉ lấy các bảng có cột IDENTITY

--OPEN table_cursor
--FETCH NEXT FROM table_cursor INTO @table_name

--WHILE @@FETCH_STATUS = 0
--BEGIN
--    -- Tạo câu lệnh DBCC CHECKIDENT cho từng bảng
--    SET @sql = 'DBCC CHECKIDENT (''dbo.' + @table_name + ''', RESEED, 0);'

--    -- Thực thi câu lệnh động
--    EXEC sp_executesql @sql

--    FETCH NEXT FROM table_cursor INTO @table_name
--END

--CLOSE table_cursor
--DEALLOCATE table_cursor
