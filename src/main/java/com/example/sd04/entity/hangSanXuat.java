package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "hang_sx")
public class hangSanXuat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten_hang_sx")
    private String tenHangSX;

    @Column(name = "mo_ta")
    private String moTa;


}
