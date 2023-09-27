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
                <h2 style="text-align: center">Our Services</h2>
                <form action="service" method="post" class="filter">
                    <h4 >Selected by</h4>
                    <select id="sort" name="id" >
                        <option value="all">All</option>
                        <option id="doctor" value="doctor">Doctor</option>
                        <option id="specialty" value="specialty">Specialty</option>
                    </select>    
                    <input class="input-submit"type="submit" value="Enter">
                </form>
            </div>

            <div class="allService">
                <ul>
                <c:forEach var="item" items="${service}">
                    <li>
                        <a href="servicelist?id=${item.getServiceId()}">
                            ${item.getServiceName()}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
