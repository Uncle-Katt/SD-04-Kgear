<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Mới Vai Trò</title>
</head>
<body>
<h2>Thêm Mới Vai Trò</h2>
<form action="/vai-tro/add" method="post">
    <div>
        <label for="ma">Mã:</label>
        <input type="text" id="ma" name="ma" required />
        <c:if test="${not empty errors['ma']}">
            <span class="error">${errors['ma']}</span>
        </c:if>
    </div>
    <div>
        <label for="tenVaiTro">Tên Vai Trò:</label>
        <input type="text" id="tenVaiTro" name="tenVaiTro" required />
        <c:if test="${not empty errors['tenVaiTro']}">
            <span class="error">${errors['tenVaiTro']}</span>
        </c:if>
    </div>

    <button type="submit">Lưu</button>
    <a href="/vai-tro/index">Quay Lại</a>
</form>
</body>
</html>
