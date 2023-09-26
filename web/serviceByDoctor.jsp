<%-- 
    Document   : service
    Created on : Sep 22, 2023, 6:33:31 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>services</title>
        <link href="css/service.css" rel="stylesheet" />
        <link href="css/home.css" rel="stylesheet" />

    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>  
            <h2>Our services</h2>
            <form action="service" method="post">
                <div class="filter">
                    <h4>Selected by:</h4>
                    <select id="sort"name="id">
                        <option value="all">All</option>
                        <option value="doctor">Doctor</option>
                        <option value="specialty">Specialty</option>
                    </select>    
                    <input class="input-submit" type="submit" value="Enter">
                </div>
            </form>

            <div class="serviceFE">
                <h4>Services sort by doctor</h4>
                <div class="docWithService">
                <c:forEach var="doc" items="${doc}">
                    <ul>
                        <br>${doc.getDoctorId()}. ${doc.getLastname()} ${doc.getFirstname()}
                    </ul>
                    <c:forEach var="service" items="${service}">
                        <c:if test="${doc.getDoctorId() == service.getDoctorId()}">
                            <a href="servicelist?id=${service.getServiceId()}">
                                ${service.getServiceName()}</a><br>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>

</html>
