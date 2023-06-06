
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông báo thất bại</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger" role="alert">
            <h4 class="alert-heading">Thất bại!</h4>
            <p>Không thể cập nhật thông tin cá nhân. Vui lòng kiểm tra lại mật khẩu và thử lại sau.</p>
            <hr>
            <p class="mb-0">Bạn có thể quay lại trang trước để tiếp tục.</p>
        </div>
        <div class="text-center">
            <c:if test="${sessionScope.user.getRole()==0}">
                <a href="home" class="btn btn-primary">Quay lại</a>
            </c:if>
                <c:if test="${sessionScope.user.getRole()!=0}">
                <a href="paitnet-home" class="btn btn-primary">Quay lại</a>
            </c:if>
            
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

