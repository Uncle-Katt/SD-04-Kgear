
<%@page language="java" pageEncoding="UTF-8" %>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên khách hàng</th>
        <th>Email</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
        <th>Ngày tạo</th>
        <th>Ngày cập nhật</th>
        <th colspan="1">Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="kh" items="${data}">
        <tr>
            <td>${kh.id}</td>
            <td>${kh.ma}</td>
            <td>${kh.tenKhachHang}</td>
            <td>${kh.email}</td>
            <td>${kh.soDienThoai}</td>
            <td>${kh.diaChi}</td>
            <td>${kh.ngayTao}</td>
            <td>${kh.ngayCapNhat}</td>
            <td><a href="/khachhang/edit/${kh.id}"><button>Sửa khách hàng</button></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/khachhang/add"><button>Thêm khách hàng</button></a>
</body>
</html>
