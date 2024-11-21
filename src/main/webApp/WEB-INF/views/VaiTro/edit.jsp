<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Vai Trò</title>
</head>
<body>
<h2>Chỉnh Sửa Vai Trò</h2>
<form action="/vaitro/update/${vaiTro.id}" method="post">
    <div>
        <label>Mã:</label>
        <form:input path="ma"/>
        <form:errors path="ma" cssClass="error"/>
    </div>
    <div>
        <label>Tên Vai Trò:</label>
        <form:input path="tenVaiTro"/>
        <form:errors path="tenVaiTro" cssClass="error"/>
    </div>

    <a href="/vaitro/index"><button type="submit">Cập Nhật</button></a>
</form>
</body>
</html>
