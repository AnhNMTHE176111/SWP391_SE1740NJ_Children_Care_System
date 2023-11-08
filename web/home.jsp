<%-- 
    Document   : home.jsp
    Created on : Sep 17, 2023, 9:54:48 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <jsp:include page="bannerHome.jsp"></jsp:include>

        <!-- Registration Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <p class="section-title pr-5"><span class="pr-2">Book A Seat</span></p>
                        <h1 class="mb-4">Book a Medical Examination</h1>
                        <p>ChildCare Center, is a leading healthcare institution dedicated to providing high-quality medical care to our community. With state-of-the-art facilities, a team of skilled healthcare professionals, and a commitment to patient well-being, we strive to be your trusted partner in health.</p>
                        <ul class="list-inline m-0">
                            <li class="py-2"><b>Inpatient Services</b></li>
                            <li class="py-2"><b>Outpatient Services</b></li>
                            <li class="py-2"><b>Emergency Care</b></li>
                        </ul>
                        <a href="booking" class="btn btn-primary mt-4 py-2 px-4">Book Now</a>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0">
                            <div class="card-header bg-secondary text-center p-4">
                                <h1 class="text-white m-0">Schedule now</h1>
                            </div>
                            <div class="card-body rounded-bottom bg-primary p-5">
                                <form>
                                    <div class="form-group">
                                        <input type="text" class="form-control border-0 p-4" placeholder="Your Name" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control border-0 p-4" placeholder="Your Email" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control border-0 p-4" placeholder="Your Phone Number" required="required" />
                                    </div>
                                    <div>
                                        <button class="btn btn-secondary btn-block border-0 py-3" type="submit">SENT</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Registration End -->



        <!-- Team Start -->
        <div class="container-fluid pt-5">
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Our Doctor</span></p>
                    <h1 class="mb-4">Meet Our Doctor</h1>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-3 text-center team mb-5">
                        <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                             <a href="/detailDoctor?doctorId=6"><img class="img-fluid w-100" src="https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/12/Duong-Van-Tien-Truong-phong-kham-Tai-Mui-Hong1-300x300.jpg" alt="" > </a>
                        </div>
                        <h4>Hà Gia Mạnh</h4>
                        <i>Professor</i>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center team mb-5">
                        <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                             <a href="detailDoctor?doctorId=8"><img class="img-fluid w-100" src="https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/10/BS-Nguyen-Xuan-Thanh-300x300.png" alt="" > </a>
                        </div>
                        <h4>Phan Văn Hồng</h4>
                        <i>Doctor</i>
                    </div>
                    
                    <div class="col-md-6 col-lg-3 text-center team mb-5">
                        <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                            <a href="/detailDoctor?doctorId=5"><img class="img-fluid w-100" src="https://cdn.benhvienthucuc.vn/wp-content/uploads/2020/06/BS-Nguyen-Thi-Kim-Loan-300x300.png" alt="" ></a>
                        </div>
                        <h4>Đỗ Cao Bảo</h4>
                        <i>Doctor</i>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center team mb-5">
                        <div class="position-relative overflow-hidden mb-4" style="border-radius: 100%;">
                            <a href="/detailDoctor?doctorId=11"><img class="img-fluid w-100" src="https://cdn.benhvienthucuc.vn/wp-content/uploads/2021/03/bac-ha1-300x300.jpg" alt="" ></a> 
                        </div>
                        <h4>Mã Văn Lộc</h4>
                        <i>Doctor</i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->

        <!-- Blog Start -->
        <div class="container-fluid pt-5">
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Our Blog</span></p>
                    <h1 class="mb-4">Typical Blog</h1>
                </div>
                <div class="row pb-3">
                    <div class="col-lg-4 mb-4">
                        <div class="card border-0 shadow-sm mb-2">
                            <a href="postDetail?postId=2"><img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20191130_030902_740495_20190226_042612_26719.max-800x800.png" alt=""></a>
                            <div class="card-body bg-light text-center p-4">
                                <h4 class="">Những lưu ý quan trọng trước khi khám sức khỏe tổng quát</h4>
                                <!--            <div class="d-flex justify-content-center mb-3">
                                               <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                               <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                              <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                </div>-->
                                <p>Theo khuyến cáo từ Hiệp hội Tim mạch Mỹ, bạn cần tiến hành kiểm tra huyết áp hàng năm ở độ tuổi từ 18 trở lên để tầm soát nguy cơ tăng huyết áp.</p>
                                <a href="postDetail?postId=2" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="card border-0 shadow-sm mb-2">
                            <a href="postDetail?postId=1"><img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20191120_084425_617598_tiem-phong-vacxin.max-800x800.png" alt=""></a>
                            <div class="card-body bg-light text-center p-4">
                                <h4 class="">Có nên trì hoãn việc tiêm chủng trong đợt dịch Covid-19?</h4>
                                <!--                            <div class="d-flex justify-content-center mb-3">
                                                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                                            </div>-->
                                <p>Theo khuyến cáo của các chuyên gia y tế, ngay cả trong thời điểm có dịch bệnh, phụ huynh vẫn nên đưa con đi tiêm vắc xin đúng lịch. </p>
                                <a href="postDetail?postId=1" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4">
                        <div class="card border-0 shadow-sm mb-2">
                            <a href="postDetail?postId=5"><img class="card-img-top mb-2" src="https://vinmec-prod.s3.amazonaws.com/images/20190909_040421_333458_giao-duc-gioi-tinh.max-800x800.jpg" alt=""></a>
                            <div class="card-body bg-light text-center p-4">
                                <h4 class="">Giáo dục giới tính cho trẻ nhỏ</h4>
                                <!--                            <div class="d-flex justify-content-center mb-3">
                                                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>
                                                            </div>-->
                                <p>Giáo dục giới tính ở trẻ em luôn là khía cạnh nhận được nhiều sự quan tâm từ phía xã hội. Trách nhiệm của cả gia đình và nhà trường </p>
</p>
                                <a href="postDetail?postId=5" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog End -->

                <jsp:include page="footer.jsp"></jsp:include>

        <script src="home.js"></script>

    </body>


</html>
