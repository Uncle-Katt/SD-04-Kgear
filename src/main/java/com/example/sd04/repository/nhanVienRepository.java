package com.example.sd04.repository;

import com.example.sd04.entity.nhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface nhanVienRepository extends JpaRepository<nhanVien, Integer> {
}
