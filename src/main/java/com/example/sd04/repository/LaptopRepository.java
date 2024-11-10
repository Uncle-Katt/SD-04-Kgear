package com.example.sd04.repository;

import com.example.sd04.entity.Laptop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LaptopRepository extends JpaRepository
        <Laptop, Integer> {
}
