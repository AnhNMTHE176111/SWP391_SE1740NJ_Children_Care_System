<%-- 
    Document   : reservationInformation
    Created on : Oct 17, 2023, 10:42:35 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href="css/reservation.css" rel="stylesheet" />
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid">
                <div class="col-md-12">
                    <div class="row">
                        <h2>Your Reservation Id:</h2>
                    </div>
                </div>
                <form>
                    <div class="col-md-12 reservation-info">
                        <div class="row">
                            <div class="col-md-3 reservation-info-content">
                                <label>Full Name</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Gender</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Telephone Number</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Email Address</label>
                                <input type="text" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 reservation-info-content">
                                <label>Reservation Date</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Time To Check Up</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Doctor Name</label>
                                <input type="text" />
                            </div>
                            <div class="col-md-3 reservation-info-content">
                                <label>Status</label>
                                <input type="text" />
                            </div>
                        </div>
                        <div class="row reservation-button">
                            <button class="bg-success btn-3" type="submit">
                                Update The Reservation
                            </button>
                            <button class="bg-danger btn-3" type="submit">
                                Cancel The Reservation
                            </button>
                        </div>
                    </div>
                </form>
                <div class="col-md-12 list-services">
                    <form class="reserved-services">
                        <div class="reserved-services-details">
                            <h2>X-ray service</h2>
                            <div>
                                <p>
                                    Chụp X-ray cho cơ xương khớp
                                </p>
                            </div>
                        </div>
                        <div class="reserved-services-details">
                            <h4>Doctor</h4>
                            <p>Doctor Name</p>
                        </div>
                        <div class="reserved-services-details">
                            <h4>Price</h4>
                            <p>30,000VND</p>
                        </div>
                        <div class="reserved-services-details">
                            <button type="submit" class="btn-reserve">Re-reserve</button>
                            <button type="submit" class="btn-feedback">Feedback</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-12 list-services">
                    <form class="reserved-services">
                        <div class="reserved-services-details">
                            <h2>Dịch vụ x-ray</h2>
                            <div>
                                <p>
                                    Chụp X-ray cho cơ xương khớp
                                </p>
                            </div>
                        </div>
                        <div class="reserved-services-details">
                            <h4>Doctor</h4>
                            <p>Doctor Name</p>
                        </div>
                        <div class="reserved-services-details">
                            <h4>Price</h4>
                            <p>30,000VND</p>
                        </div>
                        <div class="reserved-services-details">
                            <button type="submit" class="btn-reserve">Re-reserve</button>
                            <button type="submit" class="btn-feedback">Feedback</button>
                        </div>
                    </form>
                </div>
                <div class="paging col-md-12">
                    <a href="#"><button class="btn-1">1</button></a>
                    <a href="#"><button class="btn-1">1</button></a>
                    <a href="#">3</a>
                </div>
                <div class="container-fluid pt-5">
                    <div class="container">
                        <div class="text-center pb-2">
                            <p class="section-title px-5"><span class="px-2">Our Blog</span></p>
                            <h2 class="mb-4">Typical Blog</h2>
                        </div>
                        <div class="row pb-3">
                            <div class="col-lg-4 mb-4">
                                <div class="card border-0 shadow-sm mb-2">
                                    <img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20191130_030902_740495_20190226_042612_26719.max-800x800.png" alt="">
                                    <div class="card-body bg-light text-center p-4">
                                        <h4 class="">Những lưu ý quan trọng trước khi khám sức khỏe tổng quát</h4>
                                        <!--            <div class="d-flex justify-content-center mb-3">
                                                       <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                       <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                      <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                        </div>-->
                                        <p>Theo khuyến cáo từ Hiệp hội Tim mạch Mỹ, bạn cần tiến hành kiểm tra huyết áp hàng năm ở độ tuổi từ 18 trở lên để tầm soát nguy cơ tăng huyết áp.</p>
                                        <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 mb-4">
                                <div class="card border-0 shadow-sm mb-2">
                                    <img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20191120_084425_617598_tiem-phong-vacxin.max-800x800.png" alt="">
                                    <div class="card-body bg-light text-center p-4">
                                        <h4 class="">Có nên trì hoãn việc tiêm chủng trong đợt dịch Covid-19?</h4>
                                        <!--                            <div class="d-flex justify-content-center mb-3">
                                                                        <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                        <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                        <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                                                    </div>-->
                                        <p>Theo khuyến cáo của các chuyên gia y tế, ngay cả trong thời điểm có dịch bệnh, phụ huynh vẫn nên đưa con đi tiêm vắc xin đúng lịch. </p>
                                        <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 mb-4">
                                <div class="card border-0 shadow-sm mb-2">
                                    <img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20190909_040421_333458_giao-duc-gioi-tinh.max-800x800.jpg" alt="">
                                    <div class="card-body bg-light text-center p-4">
                                        <h4 class="">Giáo dục giới tính cho trẻ nhỏ</h4>
                                        <!--                            <div class="d-flex justify-content-center mb-3">
                                                                        <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                        <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                        <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                                                    </div>-->
                                        <p>Giáo dục giới tính ở trẻ em luôn là khía cạnh nhận được nhiều sự quan tâm từ phía xã hội. Trách nhiệm của cả gia đình và nhà trường </p>
                                        </p>
                                        <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script
    src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"
></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"
></script>
</html>
