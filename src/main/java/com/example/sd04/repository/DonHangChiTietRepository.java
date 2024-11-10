package com.example.sd04.repository;

import com.example.sd04.entity.DonHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonHangChiTietRepository extends JpaRepository
        <DonHangChiTiet, Integer> {
    @Query("select dhct.id, dhct.ma, dh.ma, dhct.soLuong, lp.ten, lp.gia, lp.giaNiemYet, lp.anh, dhct.tongTien  from DonHangChiTiet dhct " +
            "inner join DonHang dh on dhct.donHang.id = dh.id " +
            "inner join Laptop lp on dhct.laptop.id = lp.id")
    List<DonHangChiTiet> findAllNew();
}
