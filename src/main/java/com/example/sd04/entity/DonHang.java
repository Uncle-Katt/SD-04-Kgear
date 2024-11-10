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
@Table(name = "DonHang")
public class DonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ngay_dat")
    private Date ngayDat;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_cap_nhat")
    private Date ngayCapNhat;

    @Column(name = "dia_chi_giao_hang")
    private String diaChi;

    @Column(name = "phuong_thuc_thanh_toan")
    private String pttt;

    @Column(name = "tong_tien")
    private BigDecimal tongTien;

    @Column(name = "trang_thai")
    private String trangThai;

    @ManyToOne
    @JoinColumn(
            name = "khach_hang_id",
            referencedColumnName = "id"
    )
    private KhachHang khachHang;
}
