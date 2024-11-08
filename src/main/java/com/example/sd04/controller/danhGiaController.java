package com.example.sd04.controller;


import com.example.sd04.entity.danhGia;
import com.example.sd04.repository.danhGiaRepository;
import com.example.sd04.repository.khachHangRepository;
import com.example.sd04.repository.lapTopRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("danhgia")
public class danhGiaController {
    @Autowired
    danhGiaRepository danhGiaRepo;
    @Autowired
    lapTopRepository lapTopRepo;
    @Autowired
    khachHangRepository khachHangRepo;

    @GetMapping("index")
    public String list(Model model){
        model.addAttribute("data", danhGiaRepo.findAll());
        return "DanhGia/index";
    }

    // Hiển thị form thêm đánh giá
    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("danhGia", new danhGia());
        model.addAttribute("khachHangs", khachHangRepo.findAll());
        model.addAttribute("laptops", lapTopRepo.findAll());
        return "DanhGia/add"; // Chỉ định đến JSP form thêm
    }

    // Xử lý thêm đánh giá
    @PostMapping("/add")
    public String addDanhGia(@Valid @ModelAttribute("danhGia") danhGia danhGia, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("khachHangs", khachHangRepo.findAll());
            model.addAttribute("laptops", lapTopRepo.findAll());
            return "DanhGia/add"; // Quay lại form thêm nếu có lỗi
        }
        danhGiaRepo.save(danhGia);
        return "redirect:/danhgia/index"; // Chuyển hướng về danh sách
    }

    // Hiển thị form chỉnh sửa đánh giá
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        Optional<danhGia> danhGiaOptional = danhGiaRepo.findById(id);
        if (danhGiaOptional.isPresent()) {
            model.addAttribute("danhGia", danhGiaOptional.get());
            model.addAttribute("khachHangs", khachHangRepo.findAll());
            model.addAttribute("laptops", lapTopRepo.findAll());
            return "DanhGia/edit"; // Chỉ định đến JSP form chỉnh sửa
        } else {
            return "redirect:/danhgia/index"; // Quay lại danh sách nếu không tìm thấy
        }
    }

    // Xử lý cập nhật đánh giá
    @PostMapping("/update/{id}")
    public String updateDanhGia(@PathVariable Integer id, @Valid @ModelAttribute("danhGia") danhGia danhGiaDetails, BindingResult result) {
        if (result.hasErrors()) {
            return "DanhGia/edit"; // Quay lại form chỉnh sửa nếu có lỗi
        }
        Optional<danhGia> danhGiaOptional = danhGiaRepo.findById(id);
        if (danhGiaOptional.isPresent()) {
            danhGia danhGia = danhGiaOptional.get();
            danhGia.setMa(danhGiaDetails.getMa());
            danhGia.setKhachHang(danhGiaDetails.getKhachHang());
            danhGia.setLaptop(danhGiaDetails.getLaptop());
            danhGia.setDiemDanhGia(danhGiaDetails.getDiemDanhGia());
            danhGia.setBinhLuan(danhGiaDetails.getBinhLuan());
            danhGia.setNgayTao(danhGiaDetails.getNgayTao());
            danhGiaRepo.save(danhGia);
        }
        return "redirect:/danhgia/index"; // Chuyển hướng về danh sách
    }

}
