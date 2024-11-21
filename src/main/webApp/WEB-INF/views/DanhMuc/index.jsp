<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Danh Mục</title>
</head>
<body>
<h1>Danh Sách Danh Mục</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên Danh Mục</th>
        <th>Mô Tả</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="danhMuc" items="${data}">
        <tr>
            <td>${danhMuc.id}</td>
            <td>${danhMuc.ma}</td>
            <td>${danhMuc.tenDanhMuc}</td>
            <td>${danhMuc.moTa}</td>
            <td>
                <a href="/danh-muc/edit/${danhMuc.id}"><button>Chỉnh Sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/danh-muc/add"><button>Thêm Danh Mục</button></a>
</body>
</html>
