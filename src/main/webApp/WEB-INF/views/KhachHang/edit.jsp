<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết và cập nhật khách hàng</title>
</head>
<body>
<h1>Chi tiết và cập nhật khách hàng</h1>

<%--@elvariable id="khachHang" type="java"--%>
<form:form action="${pageContext.request.contextPath}/khachhang/edit/${khachHang.id}" method="post" modelAttribute="khachHang">
    <label>Mã:</label>
    <form:input path="ma" />
    <form:errors path="ma" cssClass="error" /><br/>

    <label>Tên khách hàng:</label>
    <form:input path="tenKhachHang" />
    <form:errors path="tenKhachHang" cssClass="error" /><br/>

    <label>Email:</label>
    <form:input path="email" />
    <form:errors path="email" cssClass="error" /><br/>

    <label>Số điện thoại:</label>
    <form:input path="soDienThoai" />
    <form:errors path="soDienThoai" cssClass="error" /><br/>

    <label>Địa chỉ:</label>
    <form:input path="diaChi" />
    <form:errors path="diaChi" cssClass="error" /><br/>

    <label>Vai trò:</label>
    <form:select path="vaiTro.id">
        <form:options items="${roles}" itemValue="id" itemLabel="tenVaiTro" />
    </form:select>
    <form:errors path="vaiTro" cssClass="error" /><br/>

    <label>Ngày tạo:</label>
    <form:input path="ngayTao" readonly="true"/><br/>


    <label>Ngày cập nhật:</label>
    <form:input path="ngayCapNhat" /><br/>

    <a href="${pageContext.request.contextPath}/khachhang/index"><button type="submit">Cập nhật</button></a>
</form:form>

</body>
</html>
