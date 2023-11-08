<%-- 
    Document   : servicesList
    Created on : Sep 22, 2023, 6:33:44 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>servicesList</title>
        <link href="css/home.css" rel="stylesheet" />
        <link href="css/serviceList.css" rel="stylesheet" />
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 col-lg-4 mb-5 mb-lg-0 wow fadeIn">
                    <div class="card border-0 shadow">
                        <img src="https://www.bootdey.com/img/Content/avatar/avatar6.png" alt="...">
                        <div class="card-body p-1-9 p-xl-5">
                            <div class="mb-4">
                                <h3 class="h4 mb-0">DR. ${doc.getLastname()} ${doc.getFirstname()}</h3>
                        </div>
                        <ul class="list-unstyled mb-4">
                            <li class="mb-3"><a href="#!"><i class="far fa-envelope display-25 me-3 text-secondary"></i>Chuyên Ngành: ${doc.getSpecialtyName()}</a></li>
                            <li class="mb-3"><a href="#!"><i class="far fa-envelope display-25 me-3 text-secondary"></i>Email: ${doc.getEmail()}</a></li>
                            <li class="mb-3"><a href="#!"><i class="fas fa-mobile-alt display-25 me-3 text-secondary"></i>Sđt: ${doc.getPhone()}</a></li>
                            <li><a href="#!"><i class="fas fa-map-marker-alt display-25 me-3 text-secondary"></i>Đánh Giá: <span id="rating"> ${doc.getRating()}/5.00</a></li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="ps-lg-1-6 ps-xl-5">
                    <div class="mb-5 wow fadeIn">
                        <div class="text-start mb-1-6 wow fadeIn">
                            <h2 class="h1 mb-0 text-primary">${serviceList.getServiceName()}</h2>
                        </div>
                        <p>${serviceList.getDescription()}.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis non purus quis tellus pretium varius. Maecenas auctor orci id purus suscipit, ac scelerisque quam ultricies. In hac habitasse platea dictumst. Integer quis ullamcorper velit. Maecenas ultrices eros ut aliquam aliquet. Sed lacinia nibh vitae erat suscipit, quis malesuada sem ultricies. </p>
                        <p class="mb-0">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                    </div>                
                </div>
                <div class="ps-lg-1-6 ps-xl-5">
                    <div class="mb-5 wow fadeIn">
                        <div class="text-start mb-1-6 wow fadeIn">
                            <h2 class="h1 mb-0 text-primary">Đặt lịch với bác sĩ ${doc.getLastname()} ${doc.getFirstname()}</h2>
                        </div>
                        <p>– Gói khám được thiết kế khoa học, gồm đầy đủ các danh mục khám cần thiết, giúp phát hiện nhiều bệnh lý bên trong cơ thể..</p>
                        <p>– Đội ngũ bác sĩ nhi hàng đầu, nhiều năm kinh nghiệm trực tiếp thăm khám..</p>
                        <p>– Cơ sở vật chất hiện đại, các thiết bị y tiên tiến giúp tầm soát bệnh hiệu quả..</p>
                        <p>– Chi phí trọn gói và tiết kiệm hơn so với khám lẻ..</p>
                    </div>
                        <a href="/booking" class="booking-link">Đặt lịch ngay</a>
                </div>


            </div>
        </div>
    </div>
    <script>
        // Get the rating element
        const ratingElement = document.getElementById('rating');

        // Parse the rating value and format it to display only 2 decimal places
        const formattedRating = parseFloat(ratingElement.textContent).toFixed(2);

        // Update the content of the rating element with the formatted value
        ratingElement.textContent = formattedRating;
    </script>
    <jsp:include page="footer.jsp"></jsp:include>
</html>

