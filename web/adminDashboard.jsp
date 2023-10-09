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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>    
    <jsp:include page="header.jsp"></jsp:include>
        <body>
        <c:if test="${sessionScope.roleId ne '4'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <jsp:include page="admin_Dashboard_ListUser.jsp"></jsp:include>
        </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
