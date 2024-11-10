package com.example.sd04.service;

import com.example.sd04.entity.DonHangChiTiet;
import com.example.sd04.repository.DonHangChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonHangChiTietService {

    @Autowired
    private DonHangChiTietRepository dhctr;

    public DonHangChiTiet getOrderId(Integer id){
        return dhctr.findById(id).orElse(null);
    }

    public List<DonHangChiTiet> findAll(){
        return dhctr.findAllNew();
    }
}
