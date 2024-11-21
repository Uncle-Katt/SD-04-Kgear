<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Màu Sắc</title>
</head>
<body>
<h1>Danh Sách Màu Sắc</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên Màu</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="mauSac" items="${data}">
        <tr>
            <td>${mauSac.id}</td>
            <td>${mauSac.ma}</td>
            <td>${mauSac.tenMau}</td>
            <td>
                <a href="/mau-sac/edit/${mauSac.id}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/mau-sac/add"><button>Thêm Màu Sắc</button></a>
</body>
</html>
