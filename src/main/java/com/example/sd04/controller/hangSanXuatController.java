package com.example.sd04.controller;

import com.example.sd04.entity.hangSanXuat;
import com.example.sd04.repository.hangSanXuatRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("hang-san-xuat")
public class hangSanXuatController {
    @Autowired
    hangSanXuatRepository hangSanXuatRepo;

    @GetMapping("index")
    public String list(Model model){
        model.addAttribute("data", hangSanXuatRepo.findAll());
        return "HangSX/index";
    }

    // Hiển thị form thêm đánh giá
    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("hangSX", new hangSanXuat());
        return "HangSX/add"; // Chỉ định đến JSP form thêm
    }

    @PostMapping("add")
    public String addHangSX(@Valid hangSanXuat hangSanXuat, BindingResult result, Model model) {
        hangSanXuatRepo.save(hangSanXuat);
        return "redirect:/hang-san-xuat/index";
    }

    @GetMapping("edit/{id}")
    public String detailHangSX(@PathVariable Integer id, Model model) {
        Optional<hangSanXuat> hangSanXuatOptional = hangSanXuatRepo.findById(id);
        if (hangSanXuatOptional.isPresent()) {
            model.addAttribute("hangSX", hangSanXuatOptional.get());
            return "HangSX/edit";
        } else {
            return "redirect:/hang-san-xuat/index";
        }
    }

    @PostMapping("update/{id}")
    public String updateHangSXDetail(@PathVariable Integer id, @Valid hangSanXuat hangSanXuatDetails, BindingResult result, Model model) {
        Optional<hangSanXuat> hangSanXuatOptional = hangSanXuatRepo.findById(id);
        if (hangSanXuatOptional.isPresent()) {
            hangSanXuat hangSanXuat = hangSanXuatOptional.get();
            hangSanXuat.setMa(hangSanXuatDetails.getMa());
            hangSanXuat.setTenHangSX(hangSanXuatDetails.getTenHangSX());
            hangSanXuat.setMoTa(hangSanXuatDetails.getMoTa());
            hangSanXuatRepo.save(hangSanXuat);
        }
        return "redirect:/hang-san-xuat/index";
    }
}
