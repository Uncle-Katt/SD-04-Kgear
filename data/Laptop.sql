CREATE DATABASE LaptopK
GO
USE LaptopK
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
    [vai_tro_id]     INT,
    [ngay_tao]       DATETIME2 DEFAULT GETDATE(),
    [ngay_cap_nhat]  DATETIME2 DEFAULT GETDATE(),
    [thu_tu]         INT          NOT NULL,
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

-- Tạo bảng san pham (san_pham)
CREATE TABLE [dbo].[san_pham]
(
    [san_pham_id] INT IDENTITY(1,1) PRIMARY KEY,
    [ten] NVARCHAR(255) NOT NULL,
    [mo_ta] NTEXT,
    [gia] DECIMAL(10, 2) NOT NULL,
    [so_luong] INT NOT NULL,
    [anh_url] VARCHAR(255)
    );
GO

-- Tạo bảng chi tiết laptop (chi_tiet_san_pham)
CREATE TABLE [dbo].[chi_tiet_san_pham]
(
    [id]                 INT IDENTITY (1,1) PRIMARY KEY,
    [ma]                 VARCHAR(50)    NOT NULL UNIQUE,
    [ten_laptop]         NVARCHAR(255)   NOT NULL,
    [san_pham_id]        INT            NOT NULL,
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
    [thong_tin_bao_hanh] NVARCHAR(255),
    [gia]                DECIMAL(10, 2) NOT NULL,
    [so_luong_ton_kho]   INT            NOT NULL,
    [mo_ta]              NTEXT,
    [anh_url]            VARCHAR(255),
    [ngay_tao]           DATETIME2   DEFAULT GETDATE(),
    [ngay_cap_nhat]      DATETIME2   DEFAULT GETDATE(),
    [trang_thai]         VARCHAR(50) DEFAULT 'chua_ban',
    [thu_tu]             INT            NOT NULL,
    FOREIGN KEY ([hang_sx_id]) REFERENCES [dbo].[hang_sx] ([id]),
    FOREIGN KEY ([mau_sac_id]) REFERENCES [dbo].[mau_sac] ([id]),
    FOREIGN KEY ([danh_muc_id]) REFERENCES [dbo].[danh_muc] ([id]),
    FOREIGN KEY (san_pham_id) REFERENCES [dbo].[san_pham]([san_pham_id])
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
    [san_pham_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   DECIMAL(10, 2) NOT NULL,
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([don_hang_id]) REFERENCES [dbo].[don_hang] ([id]),
    FOREIGN KEY ([san_pham_id]) REFERENCES [dbo].[san_pham] ([san_pham_id])
    );
GO

-- Tạo bảng giỏ hàng (gio_hang)
CREATE TABLE [dbo].[gio_hang]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [san_pham_id]     INT         NOT NULL,
    [so_luong]      INT         NOT NULL,
    [ngay_tao]      DATETIME2 DEFAULT GETDATE(),
    [thu_tu]        INT         NOT NULL,
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[khach_hang] ([id]),
    FOREIGN KEY ([san_pham_id]) REFERENCES [dbo].[san_pham] ([san_pham_id])
    );
GO

-- Tạo bảng giỏ hàng chi tiết (gio_hang_chi_tiet)
CREATE TABLE [dbo].[gio_hang_chi_tiet]
(
    [id]          INT IDENTITY (1,1) PRIMARY KEY,
    [gio_hang_id] INT            NOT NULL,
    [san_pham_id]   INT            NOT NULL,
    [so_luong]    INT            NOT NULL,
    [gia]         DECIMAL(10, 2) NOT NULL,
    [tong_tien]   AS ([so_luong] * [gia]) PERSISTED,
    [ngay_tao]    DATETIME2 DEFAULT GETDATE(),
    [thu_tu]      INT            NOT NULL,
    FOREIGN KEY ([gio_hang_id]) REFERENCES [dbo].[gio_hang] ([id]),
    FOREIGN KEY ([san_pham_id]) REFERENCES [dbo].[san_pham] ([san_pham_id])
    );
GO

-- Tạo bảng đánh giá sản phẩm (danh_gia)
CREATE TABLE [dbo].[danh_gia]
(
    [id]            INT IDENTITY (1,1) PRIMARY KEY,
    [ma]            VARCHAR(50) NOT NULL UNIQUE,
    [khach_hang_id] INT         NOT NULL,
    [san_pham_id]     INT         NOT NULL,
    [diem_danh_gia] DECIMAL(3, 2) NOT NULL CHECK ([diem_danh_gia] BETWEEN 0 AND 5),
    [binh_luan]     NTEXT,
    [ngay_tao]      DATETIME2   DEFAULT GETDATE(),
    FOREIGN KEY ([khach_hang_id]) REFERENCES [dbo].[khach_hang] ([id]),
    FOREIGN KEY ([san_pham_id]) REFERENCES [dbo].[san_pham] ([san_pham_id])
    );
GO

CREATE TABLE dbo.voucher (
                             id INT IDENTITY(1,1) PRIMARY KEY,  -- Khóa chính tự động tăng
                             ma VARCHAR(50) NOT NULL UNIQUE,     -- Mã voucher (đảm bảo duy nhất)
                             gia_tri DECIMAL(10, 2) NOT NULL,    -- Giá trị của voucher (số tiền giảm)
                             trang_thai BIT NOT NULL,            -- Trạng thái voucher (1: active, 0: inactive)
                             ngay_tao DATETIME DEFAULT GETDATE(), -- Ngày tạo voucher
                             ngay_het_han DATETIME,              -- Ngày hết hạn voucher
                             mo_ta NVARCHAR(255) NULL            -- Mô tả voucher
);
GO

CREATE TABLE [dbo].[series_laptop]
(
    [id]        INT IDENTITY (1,1) PRIMARY KEY,
    [san_pham_id] INT            NOT NULL,
    [series]    VARCHAR(50)    NOT NULL,
    [ngay_tao]  DATETIME2   DEFAULT GETDATE(),
    [thu_tu]    INT            NOT NULL,
    FOREIGN KEY ([san_pham_id]) REFERENCES [dbo].[san_pham] ([san_pham_id])
    );
GO

INSERT INTO dbo.[series_laptop] ([san_pham_id], [series], [thu_tu])
VALUES
(1, 'Gaming', 1),
(1, 'UltraSlim', 2);
GO

INSERT INTO dbo.voucher (ma, gia_tri, trang_thai, ngay_het_han, mo_ta)
VALUES
('VOUCHER001', 100000, 1, '2024-12-31', 'Giảm giá 100.000 VNĐ'),
('VOUCHER002', 50000, 1, '2024-12-31', 'Giảm giá 50.000 VNĐ');


-- Thêm dữ liệu vào bảng Vai trò (VaiTro)
INSERT INTO [dbo].[vai_tro] ([ma], [ten_vai_tro], [thu_tu])
VALUES
    ('admin', 'Quản trị viên', 1),
    ('user', 'Người dùng', 2);
GO

-- Thêm dữ liệu vào bảng khách hàng (khach_hang)
INSERT INTO [dbo].[khach_hang] ([ma], [ten_khach_hang], [email], [so_dien_thoai], [dia_chi], [vai_tro_id], [thu_tu])
VALUES
('KH001', 'Nguyễn Văn A', 'a@example.com', '0987654321', 'Hà Nội', 1, 1),
('KH002', 'Trần Thị B', 'b@example.com', '0987654322', 'TP.HCM', 2, 2);
GO

-- Thêm dữ liệu vào bảng hãng sản xuất (hang_sx)
INSERT INTO [dbo].[hang_sx] ([ma], [ten_hang_sx], [mo_ta], [thu_tu])
VALUES
('HS001', 'Apple', 'Hãng sản xuất thiết bị điện tử', 1),
('HS002', 'Dell', 'Hãng sản xuất máy tính', 2);
GO

-- Thêm dữ liệu vào bảng màu sắc (mau_sac)
INSERT INTO [dbo].[mau_sac] ([ma], [ten_mau], [thu_tu])
VALUES
('MS001', 'Đen', 1),
('MS002', 'Trắng', 2);
GO

-- Thêm dữ liệu vào bảng danh mục sản phẩm (danh_muc)
INSERT INTO [dbo].[danh_muc] ([ma], [ten_danh_muc], [mo_ta], [thu_tu])
VALUES
('DM001', 'Laptop', 'Máy tính xách tay', 1),
('DM002', 'Phụ kiện', 'Phụ kiện máy tính', 2);
GO

-- Thêm dữ liệu vào bảng san pham (san_pham)
INSERT INTO [dbo].[san_pham] ([ten], [mo_ta], [gia], [so_luong], [anh_url])
VALUES
('Laptop Dell XPS 13', 'Laptop cao cấp Dell XPS 13', 25000, 10, '/images/dell_xps_13.jpg'),
('Laptop MacBook Pro', 'Laptop MacBook Pro với hiệu năng mạnh mẽ', 35000, 5, '/images/macbook_pro.jpg');
GO

-- Thêm dữ liệu vào bảng chi tiết laptop (chi_tiet_san_pham)
INSERT INTO [dbo].[chi_tiet_san_pham] ([ma], [ten_laptop], [san_pham_id], [hang_sx_id], [mau_sac_id], [danh_muc_id], [cpu], [ram], [o_cung], [man_hinh], [card_man_hinh], [dung_luong_pin], [he_dieu_hanh], [thong_tin_bao_hanh], [gia], [so_luong_ton_kho], [mo_ta], [anh_url], [ngay_tao], [ngay_cap_nhat], [trang_thai], [thu_tu])
VALUES
('CTSP001', 'Dell XPS 13', 1, 2, 1, 1, 'Intel Core i7', '8GB', '512GB SSD', '13.3 inches', 'Intel UHD Graphics', '12h', 'Windows 10', 'Bảo hành 1 năm', 25000, 10, 'Laptop cao cấp', '/images/dell_xps_13.jpg', GETDATE(), GETDATE(), 'chua_ban', 1),
('CTSP002', 'MacBook Pro 13"', 2, 1, 2, 1, 'Apple M1', '16GB', '1TB SSD', '13 inches', 'Apple Integrated', '20h', 'macOS', 'Bảo hành 1 năm', 35000, 5, 'Laptop với hiệu năng mạnh mẽ', '/images/macbook_pro.jpg', GETDATE(), GETDATE(), 'chua_ban', 2);
GO

-- Thêm dữ liệu vào bảng đơn hàng (don_hang)
INSERT INTO [dbo].[don_hang] ([ma], [khach_hang_id], [tong_tien], [dia_chi_giao_hang], [phuong_thuc_thanh_toan], [thu_tu])
VALUES
('DH001', 1, 25000, 'Hà Nội', 'Thanh toán khi nhận hàng', 1),
('DH002', 2, 35000, 'TP.HCM', 'Chuyển khoản ngân hàng', 2);
GO

-- Thêm dữ liệu vào bảng chi tiết đơn hàng (chi_tiet_don_hang)
INSERT INTO [dbo].[chi_tiet_don_hang] ([ma], [don_hang_id], [san_pham_id], [so_luong], [gia], [tong_tien], [thu_tu])
VALUES
('CTDH001', 1, 1, 1, 25000, 25000, 1),
('CTDH002', 2, 2, 1, 35000, 35000, 2);
GO

-- Thêm dữ liệu vào bảng giỏ hàng (gio_hang)
INSERT INTO [dbo].[gio_hang] ([ma], [khach_hang_id], [san_pham_id], [so_luong], [thu_tu])
VALUES
('GH001', 1, 1, 1, 1),
('GH002', 2, 2, 1, 2);
GO

-- Thêm dữ liệu vào bảng giỏ hàng chi tiết (gio_hang_chi_tiet)
INSERT INTO [dbo].[chi_tiet_don_hang]
([ma], [don_hang_id], [san_pham_id], [so_luong], [gia], [tong_tien], [thu_tu])
VALUES
('CT01', 1, 1, 1, 25000, 25000 * 1, 1), -- Cung cấp đủ 7 giá trị
('CT02', 2, 2, 1, 35000, 35000 * 1, 2); -- Cung cấp đủ 7 giá trị


-- Thêm dữ liệu vào bảng đánh giá sản phẩm (danh_gia)
INSERT INTO [dbo].[danh_gia] ([ma], [khach_hang_id], [san_pham_id], [diem_danh_gia], [binh_luan], [ngay_tao])
VALUES
    ('DG001', 1, 1, 4.5, 'Sản phẩm tuyệt vời, rất nhanh', GETDATE()),
    ('DG002', 2, 2, 5.0, 'Máy tính chạy mượt mà, rất hài lòng', GETDATE());
GO
