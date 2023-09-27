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
            <div class="nameServiceList">
                <ul>    
                    <h2>${serviceList.getServiceId()}. ${serviceList.getServiceName()}</h2>
                <h4>   ${serviceList.getDescription()}</h4>
            </ul>
        </div>
        <ul class="inforDoctor">
            <p>${doc.getPosition()} ${doc.getLastname()} ${doc.getFirstname()}</p>
            <p>Email: ${doc.getEmail()}</p>
            <p>Sđt: ${doc.getPhone()}</p>
            <p>Chuyên Ngành: ${doc.getSpecialtyName()}</p>
            <p>Đánh Giá: ${doc.getRating()}</p>
            <p>Năm kinh nghiệm: ${doc.getExperienceYears()}</p>
            <p>Thông tin cơ bản: ${doc.getDescription()}</p>
        </ul>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>

</html>
