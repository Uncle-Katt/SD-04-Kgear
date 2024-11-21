package com.example.sd04.controller;

import com.example.sd04.entity.vaiTro;
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
@RequestMapping("vai-tro")
public class vaiTroController {
    @Autowired
    vaiTroRepository vaiTroRepo;

    @GetMapping("index")
    public String list(Model model) {
        model.addAttribute("data", vaiTroRepo.findAll());
        return "VaiTro/index";
    }

    @GetMapping("add")
    public String addForm(Model model) {
        model.addAttribute("vaiTro", new vaiTro());
        return "VaiTro/add";  // View để thêm vai trò
    }

    @PostMapping("add")
    public String addVaiTro(@Valid vaiTro vaiTro, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "VaiTro/add";
        }
        vaiTroRepo.save(vaiTro);
        return "redirect:/vai-tro/index";
    }

    @GetMapping("edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        Optional<vaiTro> vaiTroOptional = vaiTroRepo.findById(id);
        if (vaiTroOptional.isPresent()) {
            model.addAttribute("vaiTro", vaiTroOptional.get());
            return "VaiTro/edit";  // View để chỉnh sửa vai trò
        } else {
            return "redirect:/vai-tro/index";  // Nếu không tìm thấy vai trò, quay lại danh sách
        }
    }

    @PostMapping("update/{id}")
    public String updateVaiTro(@PathVariable Integer id, @Valid vaiTro vaiTroDetails, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("vaiTro", vaiTroDetails);
            return "VaiTro/update";  // Nếu có lỗi, hiển thị lại form
        }
        Optional<vaiTro> vaiTroOptional = vaiTroRepo.findById(id);
        if (vaiTroOptional.isPresent()) {
            vaiTro vaiTro = vaiTroOptional.get();
            vaiTro.setMa(vaiTroDetails.getMa());
            vaiTro.setTenVaiTro(vaiTroDetails.getTenVaiTro());
            vaiTroRepo.save(vaiTro);
        }
        return "redirect:/vai-tro/index";  // Quay lại danh sách vai trò
    }
}
