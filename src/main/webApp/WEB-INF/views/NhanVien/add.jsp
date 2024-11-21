<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Nhân Viên</title>
</head>
<body>
<h1>Thêm Nhân Viên</h1>
<form action="/nhan-vien/add" method="post">
    <label for="ma">Mã Nhân Viên:</label>
    <input type="text" id="ma" name="ma" required /><br/>

    <label for="tenNhanVien">Tên Nhân Viên:</label>
    <input type="text" id="tenNhanVien" name="tenNhanVien" required /><br/>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required /><br/>

    <label for="soDienThoai">Số Điện Thoại:</label>
    <input type="text" id="soDienThoai" name="soDienThoai" required /><br/>

    <label for="diaChi">Địa Chỉ:</label>
    <input type="text" id="diaChi" name="diaChi" /><br/>

    <label for="username">Tên Đăng Nhập:</label>
    <input type="text" id="username" name="username" required /><br/>

    <label for="password">Mật Khẩu:</label>
    <input type="text" id="password" name="password" required /><br/>

    <label for="vaiTro">Vai Trò:</label>
    <select id="vaiTro" name="vaiTro.id">
        <c:forEach var="vaiTro" items="${vaiTroList}">
            <option value="${vaiTro.id}"
                    <c:if test="${nhanVien.vaiTro != null && nhanVien.vaiTro.id == vaiTro.id}">selected</c:if>>
                    ${vaiTro.tenVaiTro}
            </option>
        </c:forEach>
    </select><br/>

    <button type="submit">Lưu Nhân Viên</button>
</form>

</body>
</html>
