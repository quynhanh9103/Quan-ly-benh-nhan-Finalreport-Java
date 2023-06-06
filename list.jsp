<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : list
    Created on : May 29, 2023, 10:58:54 AM
    Author     : Hanami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lịch sử chuẩn đoán</title>
        <c:if test="${sessionScope.user==null}">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        </c:if>

        <c:if test="${sessionScope.user!=null}">
            <jsp:useBean id="dateUtils" scope="page" class="utils.DateExp" />
            <jsp:useBean id="paitnet" scope="page" class="dao.PaitnetDAO" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <style>
                body{

                    background-image: url('https://png.pngtree.com/background/20210710/original/pngtree-medical-blue-technology-hospital-banner-background-picture-image_1037868.jpg');
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    height: 100vh;
                    margin: 0;
                }
                .container {
                    margin-top: 20px;
                }
                .search-form {
                    margin-bottom: 20px;
                }
                .search-form input {
                    margin-right: 10px;
                }
                .search-form .form-group {
                    display: inline-block;
                    margin-right: 10px;
                    margin-bottom: 10px;
                }

            </c:if>

        </style>
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
            <div class="container">
                <a href="home" class="btn btn-primary">Back</a> <!-- Thay đổi đường dẫn 'index.html' thành trang chủ của bạn -->
                <h2>Lịch sử chuẩn đoán</h2>
                <form action="search-paitnet" method="post">
                    <div  class="search-form">
                        <div class="form-group">
                            <input value="" name="nameSearch" type="text" id="searchName" placeholder="Tên" class="form-control">
                        </div>
                        <div class="form-group">
                            <input value="" name="phoneSearch" type="text" id="searchPhone" placeholder="Số điện thoại" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary" >Tìm kiếm</button>
                    </div>
                </form>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width:10rem">Mã Chuẩn Đoán</th>
                            <th>Tên</th>
                            <th style="width:10rem">Ngày chuẩn đoán</th>
                            <th>Chuẩn đoán</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${listD}">
                            <tr>
                                <td>${p.getDid()}</td>
                                <td>${paitnet.getNameByDid(p.getDid())}</td>                                
                                <td>${dateUtils.convertDate(p.getCreateAt())}</td>
                                <td>${p.getDiagnosis()}</td>
                                <td>
                                    <button id="view-diagnostic" type="button" class="btn btn-primary edit-button"
                                            data-toggle="modal" data-target="#diagnosisModal" data-patient='${p.toJSON()}'>
                                        Xem
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>


                        <!-- Thêm các dòng thông tin bệnh nhân khác tại đây -->
                    </tbody>
                </table>
            </div>

            <!-- Modal Chuẩn đoán -->
            <div class="modal fade" id="diagnosisModal" tabindex="-1" role="dialog" aria-labelledby="diagnosisModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="diagnosisModalLabel">Chuẩn đoán</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Nội dung chuẩn đoán -->
                            <p id="text-symptom">Triệu chứng: Đau đầu</p>
                            <p id="text-date">Ngày chuẩn đoán: 2021-05-01</p>
                            <p id="text-diagnosis">Chuẩn đoán:</p>
                            <p id="text-medicines"> Thuốc:</p>
                            <p id="text-wardRequired"> Nằm viện: </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>


            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script>
                $(document).ready(function () {
                    $(".edit-button").click(function () {
                        const patient = $(this).data("patient");

                        // Lấy thông tin bệnh nhân từ thuộc tính data-patient
                        // var patient = JSON.parse($(this).data("patient"));
                        // Đẩy thông tin bệnh nhân vào modal "Thêm bệnh nhân"
                        $("#text-symptom").text("Triệu chứng: " + patient.symptom);
                        $("#text-diagnosis").text("Chuẩn đoán: " + patient.diagnosis);
                        $("#text-medicines").text("Thuốc: " + patient.medicines);
                        $("#text-wardRequired").text("Nằm viện: " + (patient.wardRequired ? "có" : "không"));
                        $("#text-symptom").text("Triệu chứng: " + patient.symptom);
                        $("#text-date").text("Ngày chuẩn đoán: " + dateFormat(patient.createAt));

                    });
                });

                const month = {
                    "Jan": 1,
                    "Feb": 2,
                    "Mar": 3,
                    "Apr": 4,
                    "May": 5,
                    "Jun": 6,
                    "Jul": 7,
                    "Aug": 8,
                    "Sep": 9,
                    "Oct": 10,
                    "Nov": 11,
                    "Dec": 12
                };
                const dateFormat = (date = "Jan 1, 2020") => {
                    date = date.replace(",", "").split(" ")

                    return date[2] + "-" + (Number(month[date[0]]) / 10 >= 1 ? month[date[0]] : ("0" + month[date[0]])) + "-" + (Number(date[1]) / 10 >= 1 ? date[1] : ("0" + date[1]));
                };
            </script>
        </c:if>

    </body>
</html>



