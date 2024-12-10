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
            <a href="#" class="${page == 'dashboard' ? 'active' : ''}">Dashboard</a>
            <a href="/nhan-vien/index" class="${page == 'nhan-vien' ? 'active' : ''}"><i class="bi bi-person-vcard"></i>
                Quản lý nhân viên</a>
            <a href="/reports" class="${page == 'reports' ? 'active' : ''}">Báo Cáo</a>
            <a href="/settings" class="${page == 'settings' ? 'active' : ''}">Cài Đặt</a>
            <a href="/logout">Đăng Xuất</a>
        </nav>

        <!-- Main Content -->
        <main class="col-10 ms-sm-auto px-md-4 pt-2 pb-4 main-content">
            <div class="card mt-2 mb-2">
                <div class="card-body header-card pb-1 pt-2 d-flex justify-content-between align-items-center">
                    <h1 class="header-title text-secondary">Danh Sách Nhân Viên / Thêm Mới Nhân Viên</h1>
                    <div id="clock" class="text-danger fw-bold pb-1"></div>
                </div>
            </div>

            <!-- Table -->
            <div class="card">
                <div class="card-body">
                    <div class="btn-tb mb-3 pb-2 border-bottom border-danger-subtle">
                        <h4 class="title">Thêm mới nhân viên</h4>
                    </div>
                    <div class="btn-tb mb-3 pb-3 border-bottom">
                        <a href="/nhan-vien/add" class="${page == 'nhan-vien' ? 'active' : ''} btn btn-success btn-sm"
                           title="Thêm"><i class="bi bi-person-fill-add"></i> Thêm chức vụ</a>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Mã nhân viên</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Họ và tên</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Email</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Số điện thoại</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Địa chỉ</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Ngày sinh</label>
                            <input class="form-control mb-2" type="date">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Username</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4">
                            <label class="control-label mb-1">Password</label>
                            <input class="form-control mb-2" type="text" required="">
                        </div>
                        <div class="form-group col-4"></div>
                        <div class="form-group col-3">
                            <label class="control-label mb-1">Giới tính</label>
                            <select class="form-control mb-2" id="exampleSelect2" required="">
                                <option>-- Chọn giới tính --</option>
                                <option>Nam</option>
                                <option>Nữ</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Chức vụ</label>
                            <select class="form-select" name="chucVuId" required>
                                <option value="">-- Chọn chức vụ --</option>
                                <c:forEach var="role" items="${vaiTroList}">
                                    <option value="${role.id}">${role.tenVaiTro}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Ảnh 3x4 nhân viên</label>
                            <div id="myfileupload">
                                <input type="file" id="uploadfile" name="ImageUpload" onchange="readURL(this);"/>
                            </div>
                            <div id="thumbbox">
                                <img height="300" width="300" alt="Thumb image" id="thumbimage" style="display: none"/>
                                <a class="removeimg" href="javascript:"></a>
                            </div>
                            <div id="boxchoice">
                                <a href="javascript:" class="Choicefile"><i class="bi bi-upload"></i></a>
                                <p style="clear:both"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add Button -->
        </main>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/main.js"></script>

</body>
</html>
