<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Nhân Viên</title>
</head>
<body>
<h1>Chỉnh Sửa Nhân Viên</h1>

<form action="/nhan-vien/update/${nhanVien.id}" method="post">
    <!-- Trường ẩn để giữ ID -->
    <input type="hidden" name="id" value="${nhanVien.id}" />

    <label for="ma">Mã Nhân Viên:</label>
    <input type="text" id="ma" name="ma" value="${nhanVien.ma}" disabled="true" /><br/>

    <label for="tenNhanVien">Tên Nhân Viên:</label>
    <input type="text" id="tenNhanVien" name="tenNhanVien" value="${nhanVien.tenNhanVien}" required /><br/>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${nhanVien.email}" required /><br/>

    <label for="soDienThoai">Số Điện Thoại:</label>
    <input type="text" id="soDienThoai" name="soDienThoai" value="${nhanVien.soDienThoai}" required /><br/>

    <label for="diaChi">Địa Chỉ:</label>
    <input type="text" id="diaChi" name="diaChi" value="${nhanVien.diaChi}" /><br/>

    <label for="username">Tên Đăng Nhập:</label>
    <input type="text" id="username" name="username" value="${nhanVien.username}" required /><br/>

    <label for="password">Mật Khẩu:</label>
    <input type="text" id="password" name="password" value="${nhanVien.password}" /><br/>

    <label for="vaiTro">Vai Trò:</label>
    <select id="vaiTro" name="vaiTro.id">
        <c:forEach var="vaiTro" items="${vaiTroList}">
            <option value="${vaiTro.id}"
                    <c:if test="${nhanVien.vaiTro != null && nhanVien.vaiTro.id == vaiTro.id}">selected</c:if>>
                    ${vaiTro.tenVaiTro}
            </option>
        </c:forEach>
    </select><br/>

    <button type="submit">Cập Nhật Nhân Viên</button>
</form>

</body>
</html>
