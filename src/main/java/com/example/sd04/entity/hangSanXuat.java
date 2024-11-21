package com.example.sd04.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;


@Data
@Entity
@Table(name = "hang_sx")

public class hangSanXuat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Mã không được để trống")
    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Tên hãng sản xuất không được để trống")
    @Column(name = "ten_hang_sx")
    private String tenHangSX;

    @Column(name = "mo_ta")
    private String moTa;


}
