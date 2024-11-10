package com.example.sd04.service;

import com.example.sd04.entity.DonHang;
import com.example.sd04.repository.DonHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonHangService {

    @Autowired
    private DonHangRepository dhr;

    public List<DonHang> findAll(){
        return dhr.findAll();
    }
}
