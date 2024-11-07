package com.example.sd04.repository;

import com.example.sd04.entity.hangSanXuat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface hangSanXuatRepository extends JpaRepository<hangSanXuat, Integer> {
}
