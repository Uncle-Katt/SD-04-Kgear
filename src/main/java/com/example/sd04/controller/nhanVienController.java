package com.example.sd04.controller;

import com.example.sd04.entity.nhanVien;
import com.example.sd04.entity.vaiTro;
import com.example.sd04.repository.nhanVienRepository;
import com.example.sd04.repository.vaiTroRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("nhan-vien")
public class nhanVienController {

    @Autowired
    private nhanVienRepository nhanVienRepo;

    @Autowired
    private vaiTroRepository vaiTroRepo;

    @GetMapping("index")
    public String listNhanVien(@RequestParam(value = "soDienThoai", required = false) String soDienThoai, Model model) {
        if (soDienThoai != null && !soDienThoai.isEmpty()) {
            // Tìm kiếm nhân viên theo số điện thoại
            List<nhanVien> nhanViens = nhanVienRepo.findBySoDienThoaiContaining(soDienThoai);
            model.addAttribute("data", nhanViens);
            model.addAttribute("searchKey", soDienThoai);
        } else {
            // Hiển thị toàn bộ nhân viên nếu không có tìm kiếm
            model.addAttribute("data", nhanVienRepo.findAll());
        }
        return "NhanVien/index";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("nhanVien", new nhanVien());
        model.addAttribute("vaiTroList", vaiTroRepo.findAll());
        return "NhanVien/add";
    }

    @PostMapping("add")
    public String addNhanVien(Model model, @Valid nhanVien nhanVien, BindingResult result, @RequestParam("anhNhanVien") MultipartFile file) {
//        if (result.hasErrors()) {
//            model.addAttribute("vaiTroList", vaiTroRepo.findAll());
//            return "NhanVien/add";
//        }

        try {
            // Xử lý lưu ảnh
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename(); // Đổi tên ảnh để tránh trùng lặp
                String uploadDir = new File("src/main/resources/static/img/anhNhanVien/").getAbsolutePath();
                File uploadPath = new File(uploadDir);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }
                file.transferTo(new File(uploadDir + File.separator + fileName)); // Lưu ảnh vào thư mục
                nhanVien.setAnhNhanVien("/img/anhNhanVien/" + fileName); // Lưu đường dẫn ảnh vào cơ sở dữ liệu
            }
        } catch (IOException e) {
            e.printStackTrace();
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
//        if (result.hasErrors()) {
//            return "NhanVien/edit";
//        }
        Optional<nhanVien> nhanVienOptional = nhanVienRepo.findById(id);
        if (nhanVienOptional.isPresent()) {
            nhanVien nhanVien = nhanVienOptional.get();
            nhanVien.setTenNhanVien(nhanVienDetails.getTenNhanVien());
            nhanVien.setEmail(nhanVienDetails.getEmail());
            nhanVien.setSoDienThoai(nhanVienDetails.getSoDienThoai());
            nhanVien.setDiaChi(nhanVienDetails.getDiaChi());
            nhanVien.setGioiTinh(nhanVienDetails.getGioiTinh());
            nhanVien.setAnhNhanVien(nhanVienDetails.getAnhNhanVien());
            nhanVien.setUsername(nhanVienDetails.getUsername());
            nhanVien.setPassword(nhanVienDetails.getPassword());
            nhanVien.setVaiTro(nhanVienDetails.getVaiTro());
            nhanVien.setNgayCapNhat(new Date());
            System.out.println(nhanVien);
            nhanVienRepo.save(nhanVien);
        }
        return "redirect:/nhan-vien/index";
    }

    @GetMapping("/delete/{id}")
    public String deleteNhanVien(@PathVariable Integer id, RedirectAttributes redirectAttributes) {
        try {
            nhanVienRepo.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Xóa nhân viên thành công!");
        } catch (EmptyResultDataAccessException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy nhân viên để xóa!");
        }
        return "redirect:/nhan-vien/index";
    }
}
