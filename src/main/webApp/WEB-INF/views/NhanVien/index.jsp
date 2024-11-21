<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhân Viên</title>
</head>
<body>
<h1>Danh Sách Nhân Viên</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên Nhân Viên</th>
        <th>Email</th>
        <th>Vai Trò</th>
        <th>Ngày Tạo</th>
        <th>Ngày Cập Nhật</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="nhanVien" items="${data}">
        <tr>
            <td>${nhanVien.id}</td>
            <td>${nhanVien.ma}</td>
            <td>${nhanVien.tenNhanVien}</td>
            <td>${nhanVien.email}</td>
            <td>${nhanVien.vaiTro.tenVaiTro}</td>
            <td>${nhanVien.ngayTao}</td>
            <td>${nhanVien.ngayCapNhat}</td>
            <td>
                <a href="/nhan-vien/edit/${nhanVien.id}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/nhan-vien/add"><button>Thêm Nhân Viên</button></a>
</body>
</html>
