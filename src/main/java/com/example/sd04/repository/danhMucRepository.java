package com.example.sd04.repository;


import com.example.sd04.entity.danhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface danhMucRepository extends JpaRepository<danhMuc, Integer> {
}
