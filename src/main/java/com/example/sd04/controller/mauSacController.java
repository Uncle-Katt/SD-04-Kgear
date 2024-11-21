package com.example.sd04.controller;

import com.example.sd04.entity.mauSac;
import com.example.sd04.repository.mauSacRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("mau-sac")
public class mauSacController {

    @Autowired
    mauSacRepository mauSacRepo;

    @GetMapping("index")
    public String list(Model model) {
        model.addAttribute("data", mauSacRepo.findAll());
        return "MauSac/index";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("mauSac", new mauSac());
        return "MauSac/add";
    }

    @PostMapping("add")
    public String addMauSac(@Valid mauSac mauSac, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "MauSac/add";
        }
        mauSacRepo.save(mauSac);
        return "redirect:/mau-sac/index";
    }

    @GetMapping("edit/{id}")
    public String detailMauSac(@PathVariable Integer id, Model model) {
        Optional<mauSac> mauSacOptional = mauSacRepo.findById(id);
        if (mauSacOptional.isPresent()) {
            model.addAttribute("mauSac", mauSacOptional.get());
            return "MauSac/edit";
        } else {
            return "redirect:/mau-sac/index";
        }
    }

    @PostMapping("update/{id}")
    public String updateMauSac(@PathVariable Integer id, @Valid mauSac mauSacDetails, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "MauSac/edit";
        }
        Optional<mauSac> mauSacOptional = mauSacRepo.findById(id);
        if (mauSacOptional.isPresent()) {
            mauSac mauSac = mauSacOptional.get();
            mauSac.setMa(mauSacDetails.getMa());
            mauSac.setTenMau(mauSacDetails.getTenMau());
            mauSacRepo.save(mauSac);
        }
        return "redirect:/mau-sac/index";
    }
}
