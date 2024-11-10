package com.example.sd04.controller;

import com.example.sd04.entity.DonHangChiTiet;
import com.example.sd04.service.DonHangChiTietService;
import com.example.sd04.service.DonHangService;
import com.example.sd04.service.LaptopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;

@Controller
@RequestMapping("order")
public class DonHangController {
    @Autowired
    private DonHangChiTietService dhcts;

    @Autowired
    private DonHangService dhs;

    @Autowired
    private LaptopService ls;

    @GetMapping("list")
    public String getAll(Model model){
        model.addAttribute("list", dhs.findAll());
        return "admin/listdonhangs";
    }

    @GetMapping("checkout/{id}")
    public String checkout(
            @PathVariable("id") Integer id,
            Model model
    ){
        DonHangChiTiet donHangChiTiet = dhcts.getOrderId(id);
        donHangChiTiet.setTongTien(donHangChiTiet.getLaptop().getGia().multiply(BigDecimal.valueOf(donHangChiTiet.getSoLuong())));
        model.addAttribute("order", donHangChiTiet);
        model.addAttribute("list", dhcts.findAll());
        return "don_hang/donhangchitiets";
    }
}
