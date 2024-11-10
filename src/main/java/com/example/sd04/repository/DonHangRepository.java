package com.example.sd04.repository;

import com.example.sd04.entity.DonHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DonHangRepository extends JpaRepository
        <DonHang, Integer> {
}
