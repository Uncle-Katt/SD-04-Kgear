package com.example.sd04.entity;


import jakarta.persistence.*;
import lombok.Data;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Entity
@Table(name = "danh_gia")
@Data
public class danhGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma")
    private String ma;
    @ManyToOne
    @JoinColumn(name = "khach_hang_id")
    private khachHang khachHang;
    @ManyToOne
    @JoinColumn(name = "laptop_id")
    private laptop laptop;
    @Column(name = "diem_danh_gia")
    @Min(1)
    @Max(5)
    private Integer diemDanhGia;
    @Column(name = "binh_luan")
    private String binhLuan;
    @Column(name = "ngay_tao")
    private String ngayTao;
}

