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
@Table(name = "ChiTietDonHang")
public class DonHangChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "so_luong")
    private int soLuong;

    @Column(name = "tong_tien")
    private BigDecimal tongTien;

    @ManyToOne
    @JoinColumn(
            name = "don_hang_id",
            referencedColumnName = "id"
    )
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(
            name = "laptop_id",
            referencedColumnName = "id"
    )
    private Laptop laptop;
}
