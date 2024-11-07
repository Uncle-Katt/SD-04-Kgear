package com.example.sd04.repository;


import com.example.sd04.entity.laptop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface lapTopRepository extends JpaRepository<laptop, Integer> {
}
