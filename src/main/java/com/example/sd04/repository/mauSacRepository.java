package com.example.sd04.repository;

import com.example.sd04.entity.mauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface mauSacRepository extends JpaRepository<mauSac, Integer> {
}
