<%@ page language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Khách Hàng</title>
</head>
<body>
<h1>Thêm Khách Hàng Mới</h1>

<form action="/khachhang/add" method="post">
    <table>
        <tr>
            <th>Mã</th>
            <td><input type="text" name="ma" required maxlength="50" /></td>
        </tr>
        <tr>
            <th>Tên khách hàng</th>
            <td><input type="text" name="tenKhachHang" required maxlength="100" /></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input type="email" name="email" required maxlength="100" /></td>
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <td><input type="text" name="soDienThoai" required maxlength="20" /></td>
        </tr>
        <tr>
            <th>Địa chỉ</th>
            <td><input type="text" name="diaChi" required maxlength="255" /></td>
        </tr>
            <th>Ngày tạo</th>
            <td><input type="date" name="ngayTao" /></td>
        </tr>
        <tr>
            <th>Ngày cập nhật</th>
            <td><input type="date" name="ngayCapNhat" /></td>
        </tr>
        <tr>
            <th>Username</th>
            <td><input type="text" name="username" required maxlength="255" /></td>
        </tr>
        <tr>
            <th>Password</th>
            <td><input type="text" name="password" required maxlength="255" /></td>
        </tr>
    </table>
    <a href="/khachhang/index"><button type="submit">Lưu Khách Hàng</button></a>
</form>
</body>
</html>
