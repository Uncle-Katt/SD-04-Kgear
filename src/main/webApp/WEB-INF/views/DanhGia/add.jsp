<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm Đánh Giá</title>
</head>
<body>
<h1>Thêm Đánh Giá</h1>
<form action="/danhgia/add" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" required><br>

    <label for="khachHang">Khách Hàng:</label>
    <select id="khachHang" name="khachHang.id">
        <c:forEach var="kh" items="${khachHangs}">
            <option value="${kh.id}">${kh.tenKhachHang}</option>
        </c:forEach>
    </select><br>

    <label for="laptop">Laptop:</label>
    <select id="laptop" name="laptop.id">
        <c:forEach var="lp" items="${laptops}">
            <option value="${lp.id}">${lp.tenLaptop}</option>
        </c:forEach>
    </select><br>

    <label for="diemDanhGia">Điểm Đánh Giá:</label>
    <input type="number" id="diemDanhGia" name="diemDanhGia" required><br>

    <label for="binhLuan">Bình Luận:</label>
    <textarea id="binhLuan" name="binhLuan"></textarea><br>

    <label for="ngayTao">Ngày Tạo:</label>
    <input type="date" id="ngayTao" name="ngayTao" required><br>

    <a href="/danhgia/index"><button type="submit">them</button></a>

</form>
</body>
</html>
