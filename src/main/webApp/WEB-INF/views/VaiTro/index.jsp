<!-- VaiTro/index.jsp -->
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Vai Trò</title>
</head>
<body>
<h2>Danh Sách Vai Trò</h2>
<a href="${pageContext.request.contextPath}/vaitro/add">Thêm mới Vai Trò</a>
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
                <a href="${pageContext.request.contextPath}/vaitro/edit/${vaiTro.id}">Chỉnh sửa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
