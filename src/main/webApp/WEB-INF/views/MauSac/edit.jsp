<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Màu Sắc</title>
</head>
<body>
<h1>Chỉnh Sửa Màu Sắc</h1>
<form action="/mau-sac/update/${mauSac.id}" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" value="${mauSac.ma}" required><br>

    <label for="tenMau">Tên Màu:</label>
    <input type="text" id="tenMau" name="tenMau" value="${mauSac.tenMau}" required><br>

    <input type="submit" value="Cập Nhật">
</form>
<a href="/mau-sac/index">Trở về</a>
</body>
</html>
