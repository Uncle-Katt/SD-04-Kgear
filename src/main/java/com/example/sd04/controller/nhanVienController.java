package com.example.sd04.controller;

import com.example.sd04.entity.nhanVien;
import com.example.sd04.entity.vaiTro;
import com.example.sd04.repository.nhanVienRepository;
import com.example.sd04.repository.vaiTroRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Optional;

@Controller
@RequestMapping("nhan-vien")
public class nhanVienController {

    @Autowired
    private nhanVienRepository nhanVienRepo;

    @Autowired
    private vaiTroRepository vaiTroRepo;

    @GetMapping("index")
    public String list(Model model) {
        model.addAttribute("data", nhanVienRepo.findAll());
        return "NhanVien/index";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("nhanVien", new nhanVien());
        model.addAttribute("vaiTroList", vaiTroRepo.findAll());
        return "NhanVien/add";
    }

    @PostMapping("add")
    public String addNhanVien(@Valid nhanVien nhanVien, BindingResult result) {
        if (result.hasErrors()) {
            return "NhanVien/add";
        }
        nhanVien.setNgayTao(new Date());
        nhanVien.setNgayCapNhat(new Date());
        nhanVienRepo.save(nhanVien);
        return "redirect:/nhan-vien/index";
    }

    @GetMapping("edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        Optional<nhanVien> nhanVienOptional = nhanVienRepo.findById(id);
        if (nhanVienOptional.isPresent()) {
            model.addAttribute("nhanVien", nhanVienOptional.get());
            model.addAttribute("vaiTroList", vaiTroRepo.findAll());
            return "NhanVien/edit";
        } else {
            return "redirect:/nhan-vien/index";
        }
    }

    @PostMapping("update/{id}")
    public String updateNhanVien(@PathVariable Integer id, @Valid nhanVien nhanVienDetails, BindingResult result) {
        if (result.hasErrors()) {
            return "NhanVien/edit";
        }
        Optional<nhanVien> nhanVienOptional = nhanVienRepo.findById(id);
        if (nhanVienOptional.isPresent()) {
            nhanVien nhanVien = nhanVienOptional.get();
            nhanVien.setMa(nhanVienDetails.getMa());
            nhanVien.setTenNhanVien(nhanVienDetails.getTenNhanVien());
            nhanVien.setEmail(nhanVienDetails.getEmail());
            nhanVien.setSoDienThoai(nhanVienDetails.getSoDienThoai());
            nhanVien.setDiaChi(nhanVienDetails.getDiaChi());
            nhanVien.setNgaySinh(nhanVienDetails.getNgaySinh());
            nhanVien.setGioiTinh(nhanVienDetails.getGioiTinh());
            nhanVien.setAnhNhanVien(nhanVienDetails.getAnhNhanVien());
            nhanVien.setUsername(nhanVienDetails.getUsername());
            nhanVien.setPassword(nhanVienDetails.getPassword());
            nhanVien.setVaiTro(nhanVienDetails.getVaiTro());
            nhanVien.setNgayCapNhat(new Date());
            nhanVienRepo.save(nhanVien);
        }
        return "redirect:/nhan-vien/index";
    }
}
