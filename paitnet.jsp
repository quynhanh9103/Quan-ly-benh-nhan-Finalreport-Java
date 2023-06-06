<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bệnh nhân</title>
        <c:if test="${sessionScope.user==null}">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        </c:if>
        <jsp:useBean id="dateUtils" scope="page" class="utils.DateExp" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <c:if test="${sessionScope.user==null}">
            <style>
                body{
                    background-color: black;
                    color: white;
                }

                h1 {
                    color: red;
                }

                h6{
                    color: red;
                    text-decoration: underline;
                }
            </style>
            <div class="w3-display-middle">
                <h1 class="w3-jumbo w3-animate-top w3-center"><code>Access Denied</code></h1>
                <hr class="w3-border-white w3-animate-left" style="margin:auto;width:50%">
                <h3 class="w3-center w3-animate-right">You dont have permission to view this site.</h3>
                <h3 class="w3-center w3-animate-zoom">🚫🚫🚫🚫</h3>
                <a href="login.jsp"><h6 class="w3-center w3-animate-zoom">Back to login</h6></a>
            </div>
        </c:if>
        <c:if test="${sessionScope.user!=null}">
            <style>
                body{
                    background-image: url('https://png.pngtree.com/background/20210710/original/pngtree-medical-blue-technology-hospital-banner-background-picture-image_1037868.jpg');
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    height: 100vh;
                    margin: 0;

                }
            </style>
            <div class="container mt-5">

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#userInfoModal">Xem thông tin</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#changePasswordModal">Thay đổi mật khẩu</button>
                <a href="logout"><button type="button" class="btn btn-primary" >Đăng Xuất</button></a>
            </div>
            <div class="container"style="
    padding-top: 50px;" >
                <h1>Lịch sử chuẩn đoán</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Ngày</th>
                            <th>Triệu chứng</th>
                            <th>Chuẩn đoán</th>
                            <th>Thuốc</th>
                            <th>Nhập viện</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="d" items="${list}">
                            <tr>
                                <td>${dateUtils.convertDate(d.getCreateAt())}</td>
                                <td>${d.getSymptom()}</td>
                                <td>${d.getDiagnosis()}</td>
                                <td>${d.getMedicines()}</td>
                                <c:if test="${d.isWardRequired()}">
                                    <td>Có</td>
                                </c:if>
                                <c:if test="${!d.isWardRequired()}">
                                    <td>Không</td>
                                </c:if>

                            </tr> 
                        </c:forEach>
                        <c:if test="${list==null}">
                            <tr>
                                <td>Trống</td>
                                <td>Trống</td>
                                <td>Trống</td>
                                <td>Trống</td>
                                <td>Trống  </td>
                            </tr>
                        </c:if>

                    </tbody>
                </table>
            </div>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="userInfoModal" tabindex="-1" role="dialog" aria-labelledby="userInfoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="userInfoModalLabel">Thông tin cá nhân</h5>
                        <button  type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="modalName">Họ và tên:</label>
                            <input type="text" class="form-control" id="modalName" value="${paitnet.getName()}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="modalAge">Ngày Sinh</label>
                            <input type="date" class="form-control" id="modalAge" value="${paitnet.getDob()}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="modalGender">Số điện thoại</label>
                            <input type="text" class="form-control" id="modalGender" value="${paitnet.getContact()}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="modalAddress">Địa chỉ:</label>
                            <input type="text" class="form-control" id="modalAddress" value="${paitnet.getAddress()}" readonly>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Thay đổi mật khẩu -->
        <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="changePasswordModalLabel">Thay đổi mật khẩu</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="changepass" method="post">
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="currentPassword">Mật khẩu hiện tại:</label>
                                <input name="old" type="password" class="form-control" id="currentPassword">
                            </div>
                            <div class="form-group">
                                <label for="newPassword">Mật khẩu mới:</label>
                                <input name="new" type="password" class="form-control" id="newPassword">
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                                <input name="renew"type="password" class="form-control" id="confirmPassword">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </c:if>
</body>
</html>

