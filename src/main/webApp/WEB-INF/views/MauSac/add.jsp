<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Màu Sắc</title>
</head>
<body>
<h1>Thêm Màu Sắc</h1>
<form action="/mau-sac/add" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" required><br>

    <label for="tenMau">Tên Màu:</label>
    <input type="text" id="tenMau" name="tenMau" required><br>

    <input type="submit" value="Thêm">
</form>
<a href="/mau-sac/index">Trở về</a>
</body>
</html>
