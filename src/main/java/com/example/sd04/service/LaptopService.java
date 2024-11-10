package com.example.sd04.service;

import com.example.sd04.entity.Laptop;
import com.example.sd04.repository.LaptopRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LaptopService {
    @Autowired
    private LaptopRepository laptopRepository;

    public List<Laptop> findAll(){
        return laptopRepository.findAll();
    }
}
