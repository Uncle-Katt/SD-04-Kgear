<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Hãng Sản Xuất</title>
</head>
<body>
<h1>Danh Sách Hãng Sản Xuất</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Hãng Sản Xuất</th>
        <th>Mô tả</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="hangSX" items="${data}">
        <tr>
            <td>${hangSX.id}</td>
            <td>${hangSX.ma}</td>
            <td>${hangSX.tenHangSX}</td>
            <td>${hangSX.moTa}</td>
            <td>
                <a href="/hang-san-xuat/edit/${hangSX.id}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/hang-san-xuat/add"><button>Thêm hãng sản xuất</button></a>
</body>
</html>
