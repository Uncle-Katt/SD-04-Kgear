package com.example.sd04.controller;


import com.example.sd04.repository.danhMucRepository;
import com.example.sd04.repository.lapTopRepository;
import com.example.sd04.repository.mauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("laptop")
public class lapTopController {
    @Autowired
    lapTopRepository lapTopRepo;
    @Autowired
    mauSacRepository mauSacRepo;
    @Autowired
    danhMucRepository danhMucRepo;

    @GetMapping("index")
    public String List(Model model){
        model.addAttribute("data", lapTopRepo.findAll());
        return "LapTop/index";
    }
}
