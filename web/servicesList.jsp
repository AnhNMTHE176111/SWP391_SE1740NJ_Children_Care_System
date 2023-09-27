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
        <link href="css/service.css" rel="stylesheet" />
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>
            <div class="page-banner">
                <img src="image/service/systemCare.jpg" class="w-100">
            </div>
            <div class="servicesList" >
                <ul>    
                    <h2>${serviceList.getServiceId()}. ${serviceList.getServiceName()}</h2>
                <h4>${serviceList.getDescription()}</h4>
            </ul>
            <ul class="doctorInfo">
                <p>Bác sĩ điều tri: ${doc.getLastname()} ${doc.getFirstname()}</p>
                <p>Chuyên Ngành: ${doc.getSpecialtyName()}</p>
                <p>Năm kinh nghiệm: ${doc.getExperienceYears()}</p>
                <p>Email: ${doc.getEmail()}</p>
                <p>Sđt: ${doc.getPhone()}</p>
                <p>Đánh Giá: <span id="rating"> ${doc.getRating()}/5.00</p>
                <p style="width: 500px;">Thông tin cơ bản: ${doc.getDescription()}</p>
            </ul>

            <div class="doctorAvatar">
                <img src="image/service/defaultjpg.jpg" alt="Doctor Avatar" style="height: 300px;width: 300px;">
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
    </body>

    <jsp:include page="footer.jsp"></jsp:include>
</html>
