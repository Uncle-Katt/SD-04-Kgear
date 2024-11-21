package com.example.sd04.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Entity
@Table(name = "vai_tro")
@Data
public class vaiTro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank(message = "Không được bỏ trống mã")
    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "Không được bỏ trống tên vai trò")
    @Column(name = "ten_vai_tro")
    private String tenVaiTro;

}
