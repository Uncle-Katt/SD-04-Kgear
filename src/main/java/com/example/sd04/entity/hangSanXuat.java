package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "HangSX")
public class hangSanXuat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ten_hang_sx")
    private String tenHangSX;
}
