<%-- 
    Document   : success
    Created on : Jun 1, 2023, 7:08:27 PM
    Author     : Hanami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông báo thành công</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Thành công!</h4>
            <p>Cập nhật thông tin cá nhân thành công.</p>
            <hr>
            <p class="mb-0">Vui lòng đăng nhập lại.</p>
        </div>
        <div class="text-center">
            
            <a href="logout" class="btn btn-secondary">Quay lại trang đăng nhập</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
