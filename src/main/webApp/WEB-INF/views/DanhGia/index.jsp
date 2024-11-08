<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Đánh Giá</title>
</head>
<body>
<h1>Danh Sách Đánh Giá</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Khách Hàng</th>
        <th>Laptop</th>
        <th>Điểm Đánh Giá</th>
        <th>Bình Luận</th>
        <th>Ngày Tạo</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="danhGia" items="${data}">
        <tr>
            <td>${danhGia.id}</td>
            <td>${danhGia.ma}</td>
            <td>${danhGia.khachHang.tenKhachHang}</td>
            <td>${danhGia.laptop.tenLaptop}</td>
            <td>${danhGia.diemDanhGia}</td>
            <td>${danhGia.binhLuan}</td>
            <td>${danhGia.ngayTao}</td>
            <td>
                <a href="/danhgia/edit/${danhGia.id}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/danhgia/add"><button>Thêm Đánh Giá</button></a>
</body>
</html>
