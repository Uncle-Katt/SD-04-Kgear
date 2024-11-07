<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Đánh Giá</title>
</head>
<body>
<h1>Chỉnh Sửa Đánh Giá</h1>
<form action="/danhgia/update/${danhGia.id}" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" value="${danhGia.ma}" required><br>

    <label for="khachHang">Khách Hàng:</label>
    <select id="khachHang" name="khachHang.id">
        <c:forEach var="kh" items="${khachHangs}">
            <option value="${kh.id}" <c:if test="${kh.id == danhGia.khachHang.id}">selected</c:if>>${kh.tenKhachHang}</option>
        </c:forEach>
    </select><br>

    <label for="laptop">Laptop:</label>
    <select id="laptop" name="laptop.id">
        <c:forEach var="lp" items="${laptops}">
            <option value="${lp.id}" <c:if test="${lp.id == danhGia.laptop.id}">selected</c:if>>${lp.tenLaptop}</option>
        </c:forEach>
    </select><br>

    <label for="diemDanhGia">Điểm Đánh Giá:</label>
    <input type="number" id="diemDanhGia" name="diemDanhGia" value="${danhGia.diemDanhGia}" required><br>

    <label for="binhLuan">Bình Luận:</label>
    <textarea id="binhLuan" name="binhLuan">${danhGia.binhLuan}</textarea><br>

    <label for="ngayTao">Ngày Tạo:</label>
    <input type="date" id="ngayTao" name="ngayTao" value="${fn:substring(danhGia.ngayTao, 0, 10)}" required><br>

    <input type="submit" value="Cập Nhật">
</form>
<a href="/danhgia/index">Trở về</a>
</body>
</html>
