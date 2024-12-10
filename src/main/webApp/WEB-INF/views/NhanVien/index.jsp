<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Nhân Viên</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-danger border-bottom fixed-top">
    <div class="container-fluid">
        <!-- Logo ở bên trái -->
        <a class="navbar-brand d-flex align-items-center" href="/">
            <img src="/img/logo.png" alt="Logo" class="ms-3" style="height: 35px;">
        </a>
        <!-- Nội dung khác của navbar -->
        <div class="dropdown ms-auto">
            <a class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle" href="#" role="button"
               id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://via.placeholder.com/40" alt="Avatar" class="rounded-circle me-2"
                     style="width: 30px; height: 30px;">
                <span class="fw-semibold text-light">Nguyễn Văn A</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userDropdown">
                <li><a class="dropdown-item" href="/user/info"><i class="bi bi-person-circle me-2"></i>Thông tin cá nhân</a>
                </li>
                <li><a class="dropdown-item" href="/user/change-password"><i class="bi bi-key me-2"></i>Đổi mật khẩu</a>
                </li>
                <li>
                    <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item text-danger" href="/logout"><i class="bi bi-box-arrow-right me-2"></i>Đăng
                    xuất</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-2 sidebar d-flex flex-column">
            <div class="text-dark mb-4 ms-2 border-bottom pb-2">
                <img src="https://via.placeholder.com/50" alt="Avatar" class="rounded-circle me-2"
                     style="width: 50px; height: 50px;">
                <span class="fw-semibold text-dark">Nguyễn Văn A</span>
            </div>
            <a href="#">Dashboard</a>
            <a href="/nhan-vien/index"><i class="bi bi-person-vcard"></i>
                Quản lý nhân viên</a>
            <a href="/reports">Báo Cáo</a>
            <a href="/settings">Cài Đặt</a>
            <a href="/logout">Đăng Xuất</a>
        </nav>

        <!-- Main Content -->
        <main class="col-10 ms-sm-auto px-md-4 pt-2 pb-4 main-content">
            <div class="card mt-2 mb-2">
                <div class="card-body header-card pb-1 pt-2 d-flex justify-content-between align-items-center">
                    <h1 class="header-title text-secondary">Danh Sách Nhân Viên</h1>
                    <div id="clock" class="text-danger fw-bold pb-1"></div>
                </div>
            </div>

            <!-- Table -->
            <div class="card">
                <div class="card-body">
                    <div class="btn-tb mb-3 pb-3 border-bottom">
                        <a href="/nhan-vien/add" class="${page == 'nhan-vien' ? 'active' : ''} btn btn-info btn-sm"
                           title="Thêm"><i
                                class="bi bi-plus-circle-fill"></i></i> Thêm nhân viên</a>
                        <a href="#" class="btn btn-warning btn-sm" title="Nhập"><i
                                class="bi bi-file-earmark-arrow-up-fill"></i> Nhập từ file</a>
                        <a href="#" class="btn btn-success btn-sm" title="Xuất Excel"><i
                                class="bi bi-file-earmark-excel-fill"></i> Xuất Excel</a>
                        <a href="#" class="btn btn-danger btn-sm" title="Xuất PDF"><i
                                class="bi bi-file-earmark-pdf-fill"></i> Xuất PDF</a>
                        <a href="#" class="btn btn-secondary btn-sm" title="Xóa tất cả"><i class="bi bi-trash"></i> Xóa
                            tất cả</a>
                    </div>
                    <div class="row mb-3 d-flex align-items-center justify-content-between">
                        <div class="col-6 d-flex align-items-center">
                            <label class="label mb-0">Hiện</label>
                            <select class="form-select mx-2" style="width: auto;">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                            <span>danh mục</span>
                        </div>
                        <div class="col-6">
                            <div class="d-flex justify-content-end">
                                <div class="d-flex align-items-center p-1 border"
                                     style="width: fit-content; gap: 5px; border-radius: 4px;">
                                    <label class="mb-0">Tìm kiếm:</label>
                                    <input type="search" class="form-control form-control-sm"
                                           style="width: 150px; height: 30px;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <table class="table table-bordered table-hover">
                        <thead class="table-Secondary">
                        <tr class="text-center">
                            <th>Mã</th>
                            <th>Họ Và Tên</th>
                            <th>Ảnh Thẻ</th>
                            <th>Địa Chỉ</th>
                            <th>Ngày Sinh</th>
                            <th>Giới Tính</th>
                            <th>Liên Lạc</th>
                            <th>Chức Vụ</th>
                            <th width="110px">Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="nhanVien" items="${data}">
                            <tr>
                                <td>${nhanVien.ma}</td>
                                <td>${nhanVien.tenNhanVien}</td>
                                <td class="text-center">
                                    <img src="${nhanVien.anhNhanVien}" alt="Ảnh nhân viên" width="50" height="50"
                                         class="rounded">
                                </td>
                                <td>${nhanVien.diaChi}</td>
                                <td>${nhanVien.ngaySinh}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${nhanVien.gioiTinh == 0}">Nam</c:when>
                                        <c:when test="${nhanVien.gioiTinh == 1}">Nữ</c:when>
                                        <c:otherwise>Không xác định</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${nhanVien.soDienThoai} | ${nhanVien.email}</td>
                                <td>${nhanVien.vaiTro.tenVaiTro}</td>
                                <td class="text-center">
                                    <a href="/nhan-vien/edit/${nhanVien.id}" class="btn btn-outline-warning btn-sm"
                                       title="Chỉnh sửa"><i class="bi bi-pencil-square"></i></a>
                                    <a href="/nhan-vien/edit/${nhanVien.id}" class="btn btn-outline-danger btn-sm"
                                       title="Xóa"><i class="bi bi-trash"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Add Button -->
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/main.js"></script>

</body>
</html>
