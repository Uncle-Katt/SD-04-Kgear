package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Laptop")
public class Laptop {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten_laptop")
    private String ten;

    @Column(name = "cpu")
    private String cpu;

    @Column(name = "ram")
    private String ram;

    @Column(name = "o_cung")
    private String rom;

    @Column(name = "man_hinh")
    private String manHinh;

    @Column(name = "card_man_hinh")
    private String card;

    @Column(name = "dung_luong_pin")
    private String pin;

    @Column(name = "he_dieu_hanh")
    private String heDieuHanh;

    @Column(name = "thong_tin_bao_hanh")
    private String baoHanh;

    @Column(name = "gia")
    private BigDecimal gia;

    @Column(name = "gia_niem_yet")
    private BigDecimal giaNiemYet;

    @Column(name = "so_luong_ton_kho")
    private int soLuong;

    @Column(name = "mo_ta")
    private String moTa;

    @Column(name = "anh_url")
    private String anh;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "trang_thai")
    private String trangThai;

}
