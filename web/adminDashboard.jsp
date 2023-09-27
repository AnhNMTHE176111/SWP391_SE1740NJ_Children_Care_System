<%-- 
    Document   : adminDashboard
    Created on : Sep 27, 2023, 11:23:48 PM
    Author     : dmx
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServlet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>    
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:if test="${sessionScope.roleId ne '4'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <h1>Admin Dashboard ${sessionScope.roleId}</h1>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
