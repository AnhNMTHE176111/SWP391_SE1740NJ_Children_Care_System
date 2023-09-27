<%-- 
    Document   : staffDashboard
    Created on : Sep 27, 2023, 11:24:50 PM
    Author     : dmx
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <body>
        <c:if test="${sessionScope.roleId ne '2'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <h1>Staff Dashboard ${sessionScope.roleId}</h1>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
