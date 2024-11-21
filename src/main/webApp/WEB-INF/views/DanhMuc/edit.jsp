<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Danh Mục</title>
</head>
<body>
<h1>Chỉnh Sửa Danh Mục</h1>
<form action="/danh-muc/update/${danhMuc.id}" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" value="${danhMuc.ma}" required><br>

    <label for="tenDanhMuc">Tên Danh Mục:</label>
    <input type="text" id="tenDanhMuc" name="tenDanhMuc" value="${danhMuc.tenDanhMuc}" required><br>

    <label for="moTa">Mô Tả:</label>
    <textarea id="moTa" name="moTa">${danhMuc.moTa}</textarea><br>

    <input type="submit" value="Cập Nhật">
</form>
<a href="/danh-muc/index">Trở về</a>
</body>
</html>
