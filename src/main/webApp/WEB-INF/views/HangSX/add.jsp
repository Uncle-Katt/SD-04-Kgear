<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Hãng Sản xuất</title>
</head>
<body>
<h1>Thêm Hãng Sản xuất</h1>
<form action="/hang-san-xuat/add" method="post">
    <label for="ma">Mã:</label>
    <input type="text" id="ma" name="ma" required><br>

    <label for="tenHangSX">Hãng sản xuất:</label>
    <input type="text" id="tenHangSX" name="tenHangSX" required><br>

    <label for="moTa">Mô tả:</label>
    <textarea id="moTa" name="moTa"></textarea><br>

    <a href="/hang-san-xuat/index"><button type="submit">them</button></a>

</form>
</body>
</html>
