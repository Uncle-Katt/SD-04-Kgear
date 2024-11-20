package com.example.sd04.controller;

import com.example.sd04.entity.khachHang;
import com.example.sd04.repository.khachHangRepository;
import com.example.sd04.repository.vaiTroRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("khachhang")
public class khachHangController {
    @Autowired
    khachHangRepository khachHangRepo;
    @Autowired
    vaiTroRepository vaiTroRepo;


    @GetMapping("/index")
    public String list(Model model) {
        model.addAttribute("data", khachHangRepo.findAll());
        return "KhachHang/index";
    }

    @GetMapping("add")
    public String addForm(Model model) {
        model.addAttribute("khachHang", new khachHang());
        model.addAttribute("roles", vaiTroRepo.findAll());
        return "KhachHang/add";
    }

    @PostMapping("add")
    public String addKhachHang(@Valid khachHang khachHang, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("roles", vaiTroRepo.findAll());
            return "KhachHang/add";
        }
        khachHangRepo.save(khachHang);
        return "redirect:/khachhang/index";
    }

    @GetMapping("edit/{id}")
    public String detailKhachHang(@PathVariable Integer id, Model model) {
        Optional<khachHang> khachHangOptional = khachHangRepo.findById(id);
        if (khachHangOptional.isPresent()) {
            model.addAttribute("khachHang", khachHangOptional.get());
            return "KhachHang/edit";
        } else {
            return "redirect:/khachhang/index";
        }
    }

    @PostMapping("edit/{id}")
    public String updateKhachHangDetail(@PathVariable Integer id, @Valid khachHang khachHangDetails, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("roles", vaiTroRepo.findAll());
            return "KhachHang/edit";
        }
        Optional<khachHang> khachHangOptional = khachHangRepo.findById(id);
        if (khachHangOptional.isPresent()) {
            khachHang khachHang = khachHangOptional.get();
            khachHang.setMa(khachHangDetails.getMa());
            khachHang.setTenKhachHang(khachHangDetails.getTenKhachHang());
            khachHang.setEmail(khachHangDetails.getEmail());
            khachHang.setSoDienThoai(khachHangDetails.getSoDienThoai());
            khachHang.setDiaChi(khachHangDetails.getDiaChi());
            khachHang.setVaiTro(khachHangDetails.getVaiTro());
            khachHang.setNgayCapNhat(khachHangDetails.getNgayCapNhat());

            khachHangRepo.save(khachHang);
        }
        return "redirect:/khachhang/index";
    }
}
