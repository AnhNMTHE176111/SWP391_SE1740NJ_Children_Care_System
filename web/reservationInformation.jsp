<%-- 
    Document: reservationInformation
    Created on: Oct 17, 2023, 10:42:35 PM
    Author: ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous"
              referrerpolicy="no-referrer" />
        <link href="css/reservation.css" rel="stylesheet" />
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid">
                <form action="information" method="post">
                    <input type="hidden" name="bookingId" value="${sessionScope.bookingId}">
                <div class="col-md-12">
                    <div class="row">
                        <h2>Your Reservation Id: ${sessionScope.bookingId}</h2>
                    </div>
                </div>
                <div class="col-md-12 reservation-detail">
                    <div class="col-md-3" style="padding: 0%">
                        <img
                            class="col-md-12"
                            src="./image/reservation/nurse.png"
                            alt=""
                            style="width: 400px; padding: 0%"
                            />
                    </div>
                    <div class="col-md-6 reservation-info">
                        <div class="row">
                            <div class="col-md-6 reservation-info-content">
                                <label>Full Name</label>
                                <input type="text" value="${cusInfo.lastName} ${cusInfo.firstName}" readonly/>
                            </div>
                            <div class="col-md-6 reservation-info-content">
                                <label>Gender</label>
                                <input type="text" value="${cusInfo.gender}" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 reservation-info-content">
                                <label>Telephone Number</label>
                                <input type="text" value="${cusInfo.phone}" readonly/>
                            </div>
                            <div class="col-md-6 reservation-info-content">
                                <label>Email Address</label>
                                <input type="text" value="${cusInfo.email}" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 reservation-info-content">
                                <label>Reservation Date</label>
                                <input type="text" value="${cusInfo.reservationDate}" readonly/>
                            </div>
                            <div class="col-md-6 reservation-info-content">
                                <label>Time To Check Up</label>
                                <input type="text" value="${cusInfo.timeCheckUp}" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 reservation-info-content">
                                <label>Diagnosis</label>
                                <input type="text" value="${cusInfo.diagnosis}" readonly/>
                            </div>
                            <div class="col-md-6 reservation-info-content">
                                <label>Status</label>
                                <c:choose>
                                    <c:when test="${cusInfo.status == 1}">
                                        <input type="text" style="color: #e0d31e" value="Submitted" readonly />
                                    </c:when>
                                    <c:when test="${cusInfo.status == 2}">
                                        <input type="text" style="color: yellowgreen" value="Success" readonly />
                                    </c:when>
                                    <c:when test="${cusInfo.status == 3}">
                                        <input type="text" style="color: red" value="Cancelled" readonly />
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" value="Unknown Status" readonly />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row reservation-button">
                            <c:choose>
                                <c:when test="${cusInfo.status == 3}">
                                    <div>
                                        <a href="/my">--- Return to your reservation list ---</a><br>
                                        <p class="cancel_success">${requestScope.mess}</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <button class="bg-danger btn-3" type="submit">
                                        Cancel The Reservation
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="col-md-2 reservation-info-section">
                        <div class="row">
                            <div class="col-md-12 reservation-info-section_1">
                                <h3 class="reservation-info-section-detail-1">Your service is:</h3>
                                <h5 class="reservation-info-section-detail-2">${cusService.serviceName}</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 reservation-info-section_2">
                                <h3 class="reservation-info-section-detail-1">Service Description:</h3>
                                <h5 class="reservation-info-section-detail-2">${cusService.description}</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 reservation-info-section_3">
                                <h3 class="reservation-info-section-detail-1">Doctor Name:</h3>
                                <h5 class="reservation-info-section-detail-2">Dr ${cusService.doctorName}</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 reservation-info-section_4">
                                <h3 class="reservation-info-section-detail-1">Service Price:</h3>
                                <h5 class="reservation-info-section-detail-2">${cusService.price} VND</h5>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
            <div class="container-fluid pt-5">
                <div class="container">
                    <div class="text-center pb-2">
                        <p class="section-title px-5"><span class="px-2">Our Blog</span></p>
                        <h2 class="mb-4">Typical Blog</h2>
                    </div>
                    <div class="row pb-3">
                        <div class="col-lg-4 mb-4">
                            <div class="card border-0 shadow-sm mb-2">
                                <img class="card-img-top mb-2"
                                     src="https://vinmec-prod.s3.amazonaws.com/images/20191130_030902_740495_20190226_042612_26719.max-800x800.png"
                                     alt="">
                                <div class="card-body bg-light text-center p-4">
                                    <h4 class="">Những lưu ý quan trọng trước khi khám sức khỏe tổng quát</h4>
                                    <p>Theo khuyến cáo từ Hiệp hội Tim mạch Mỹ, bạn cần tiến hành kiểm tra huyết áp hàng năm ở độ tuổi từ 18 trở lên để tầm soát nguy cơ tăng huyết áp.</p>
                                    <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-4">
                            <div class="card border-0 shadow-sm mb-2">
                                <img class="card-img-top mb-2"
                                     src="https://vinmec-prod.s3.amazonaws.com/images/20191120_084425_617598_tiem-phong-vacxin.max-800x800.png"
                                     alt="">
                                <div class "card-body bg-light text-center p-4">
                                    <h4 class="">Có nên trì hoãn việc tiêm chủng trong đợt dịch Covid-19?</h4>
                                    <p>Theo khuyến cáo của các chuyên gia y tế, ngay cả trong thời điểm có dịch bệnh, phụ huynh vẫn nên đưa con đi tiêm vắc xin đúng lịch. </p>
                                    <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-4">
                            <div class="card border-0 shadow-sm mb-2">
                                <img class="card-img-top mb-2"
                                     src="https://vinmec-prod.s3.amazonaws.com/images/20190909_040421_333458_giao-duc-gioi-tinh.max-800x800.jpg"
                                     alt="">
                                <div class="card-body bg-light text-center p-4">
                                    <h4 class="">Giáo dục giới tính cho trẻ nhỏ</h4>
                                    <p>Giáo dục giới tính ở trẻ em luôn là khía cạnh nhận được nhiều sự quan tâm từ phía xã hội. Trách nhiệm của cả gia đình và nhà trường </p>
                                    <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="./js/changeImageProfile.js"></script>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>
</html>
