<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Mới Vai Trò</title>
</head>
<body>
<h2>Thêm Mới Vai Trò</h2>
<form action="/vaitro/add" method="post">
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

    <a href="/vaitro/index"><button type="submit">Lưu</button></a>
</form>
</body>
</html>
