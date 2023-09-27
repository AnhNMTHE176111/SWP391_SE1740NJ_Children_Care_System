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
            <div class="page-banner">
                <img src="image/service/systemCare.jpg" class="w-100">
            </div>
            <div class="our-service">
                <h2 style="text-align: center" >Our Services</h2>
                <form action="service" method="post" class="filter">
                    <div >
                        <h4>Selected by:</h4>
                        <select id="sort"name="id">
                            <option value="all">All</option>
                            <option value="doctor">Doctor</option>
                            <option value="specialty">Specialty</option>
                        </select>    
                        <input class="input-submit" type="submit" value="Enter">
                    </div>
                </form>
            </div>

            <div class="doctorService">
                <div class="scrollable-section">
                    <c:forEach var="spec" items="${spec}">
                        <div class="doctor">
                            <h5>${spec.getSpecialtyId()}. ${spec.getSpecialtyName()}</h5>
                            <ul class="services">
                            <c:forEach var="serBySpec" items="${serBySpec}">
                                <c:if test="${ spec.getSpecialtyId()==serBySpec.getSpecId()  }">
                                    <li>
                                        <a href="servicelist?id=${serBySpec.getServiceId()}"> ${serBySpec.getServiceName()}</a>  
                                    </li>
                                </c:if>
                            </c:forEach>
                            <ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
