package com.example.sd04.repository;

import com.example.sd04.entity.khachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface khachHangRepository extends JpaRepository<khachHang, Integer> {
}
