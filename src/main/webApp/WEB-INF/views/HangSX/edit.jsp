<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Hãng Sản Xuất</title>
</head>
<body>
<h1>Chỉnh Sửa Hãng Sản Xuất</h1>
<form action="/hang-san-xuat/update/${hangSX.id}" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" value="${hangSX.ma}" required><br>

    <label for="tenHangSX">Hãng sản xuất:</label>
    <input type="text" id="tenHangSX" name="tenHangSX" value="${hangSX.tenHangSX}" required><br>

    <label for="moTa">Mô tả:</label>
    <textarea id="moTa" name="moTa">${hangSX.moTa}</textarea><br>

    <input type="submit" value="Cập Nhật">
</form>
<a href="/hang-san-xuat/index">Trở về</a>
</body>
</html>
