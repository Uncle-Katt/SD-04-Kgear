package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "laptop")
@Data
public class laptop {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma", nullable = false, unique = true, length = 50)
    private String ma;

    @Column(name = "ten_laptop", nullable = false, length = 255)
    private String tenLaptop;

    @Column(name = "cpu", length = 100)
    private String cpu;

    @Column(name = "ram", length = 50)
    private String ram;

    @Column(name = "o_cung", length = 50)
    private String oCung;

    @Column(name = "man_hinh", length = 50)
    private String manHinh;

    @Column(name = "card_man_hinh", length = 50)
    private String cardManHinh;

    @Column(name = "dung_luong_pin", length = 50)
    private String dungLuongPin;

    @Column(name = "he_dieu_hanh", length = 50)
    private String heDieuHanh;

    @Column(name = "thong_tin_bao_hanh", length = 255)
    private String thongTinBaoHanh;

    @Column(name = "gia", nullable = false, precision = 10, scale = 2)
    private BigDecimal gia;

    @Column(name = "so_luong_ton_kho", nullable = false)
    private Integer soLuongTonKho;

    @Column(name = "mo_ta", columnDefinition = "TEXT")
    private String moTa;

    @Column(name = "anh_url", length = 255)
    private String anhUrl;

    @Column(name = "ngay_tao", columnDefinition = "DATETIME2 DEFAULT GETDATE()")
    private LocalDateTime ngayTao;

    @Column(name = "ngay_cap_nhat", columnDefinition = "DATETIME2 DEFAULT GETDATE()")
    private LocalDateTime ngayCapNhat;

    @Column(name = "trang_thai", length = 50, columnDefinition = "VARCHAR(50) DEFAULT 'chua_ban'")
    private String trangThai;

    // Quan hệ với các bảng khác
    @ManyToOne
    @JoinColumn(name = "hang_sx_id", nullable = false)
    private hangSanXuat hangSX;

    @ManyToOne
    @JoinColumn(name = "mau_sac_id", nullable = false)
    private mauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "danh_muc_id", nullable = false)
    private danhMuc danhMuc;

}

