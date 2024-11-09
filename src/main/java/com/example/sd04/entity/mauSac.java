package com.example.sd04.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "mau_sac")
@Data
public class mauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma")
    private String ma;
    @Column(name = "ten_mau")
    private String tenMau;
}
