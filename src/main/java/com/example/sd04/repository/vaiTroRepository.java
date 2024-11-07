package com.example.sd04.repository;

import com.example.sd04.entity.vaiTro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface vaiTroRepository extends JpaRepository<vaiTro, Integer> {
}
