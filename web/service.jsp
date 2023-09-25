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

    </head>
    <body>  
        <h2>Our services</h2>
        <form action="service" method="post">
            <div class="filter">
                <h4>Selected by:</h4>
                <select id="sort" name="id">
                    <option value="all">All</option>
                    <option id="doctor" value="doctor">Doctor</option>
                    <option id="specialty" value="specialty">Specialty</option>
                </select>    
                <input type="submit" value="Enter">
            </div>
        </form>

        <div class="serviceFE">
            <h4>All of our services</h4>
            <ul>
                <c:forEach var="item" items="${service}">
                    <a href="servicelist?id=${item.getServiceId()}">
                        ${item.getServiceId()}. ${item.getServiceName()}
                    </a><br>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>
