package com.example.sd04.controller;

import com.example.sd04.entity.danhMuc;
import com.example.sd04.repository.danhMucRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("danh-muc")
public class danhMucController {

    @Autowired
    private danhMucRepository danhMucRepo;

    @GetMapping("index")
    public String list(Model model) {
        model.addAttribute("data", danhMucRepo.findAll());
        return "DanhMuc/index";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("danhMuc", new danhMuc());
        return "DanhMuc/add";
    }

    @PostMapping("add")
    public String addDanhMuc(@Valid danhMuc danhMuc, BindingResult result) {
        if (result.hasErrors()) {
            return "DanhMuc/add";
        }
        danhMucRepo.save(danhMuc);
        return "redirect:/danh-muc/index";
    }

    @GetMapping("edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        Optional<danhMuc> danhMucOptional = danhMucRepo.findById(id);
        if (danhMucOptional.isPresent()) {
            model.addAttribute("danhMuc", danhMucOptional.get());
            return "DanhMuc/edit";
        } else {
            return "redirect:/danh-muc/index";
        }
    }

    @PostMapping("update/{id}")
    public String updateDanhMuc(@PathVariable Integer id, @Valid danhMuc danhMucDetails, BindingResult result) {
        if (result.hasErrors()) {
            return "DanhMuc/edit";
        }
        Optional<danhMuc> danhMucOptional = danhMucRepo.findById(id);
        if (danhMucOptional.isPresent()) {
            danhMuc danhMuc = danhMucOptional.get();
            danhMuc.setMa(danhMucDetails.getMa());
            danhMuc.setTenDanhMuc(danhMucDetails.getTenDanhMuc());
            danhMuc.setMoTa(danhMucDetails.getMoTa());
            danhMucRepo.save(danhMuc);
        }
        return "redirect:/danh-muc/index";
    }
}
