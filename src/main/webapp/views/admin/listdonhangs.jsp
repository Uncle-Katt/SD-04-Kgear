<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <h2>DANH SÁCH ĐƠN HÀNG</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã đơn hàng</th>
                <th>Tên khách hàng</th>
                <th>Tổng tiền</th>
                <th>Phương thức thanh toán</th>
                <th>Ngày đặt</th>
                <th>Địa chỉ</th>
                <th>Trạng thái</th>
                <th>Hoạt động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="order" varStatus="i">
                <tr>
                    <td>i.index + 1</td>
                    <td>${order.ma}</td>
                    <td>${order.khachHang.ten}</td>
                    <td>${order.tongTien}</td>
                    <td>${order.pttt}</td>
                    <td>${order.ngayDat}</td>
                    <td>${order.diaChi}</td>
                    <td>${order.trangThai}</td>
                    <td>
                        <a href="/checkout/${order.id}"><button class="btn btn-primary"><i class="bi bi-eye-fill"></i></button></a>
                        <a href="/updateStatus/${order.id}"><button class="btn btn-warring"><i class="bi bi-pencil-fill"></i></button></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>