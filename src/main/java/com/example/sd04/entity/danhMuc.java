package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "DanhMuc")
@Data
public class danhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma")
    private String ma;
    @Column(name = "ten_danh_muc")
    private String ten;
    @Column(name = "mo_ta")
    private String moTa;
}