<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Vai Trò</title>
</head>
<body>
<h1>Danh Sách Vai Trò</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Mã</th>
        <th>Tên Vai Trò</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="vaiTro" items="${data}">
        <tr>
            <td>${vaiTro.id}</td>
            <td>${vaiTro.ma}</td>
            <td>${vaiTro.tenVaiTro}</td>
            <td>
                <a href="${pageContext.request.contextPath}/vai-tro/edit/${vaiTro.id}"><button>Chỉnh sửa</button></a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/vai-tro/add"><button>Thêm Vai Trò</button></a>

</body>
</html>
