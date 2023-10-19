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
        <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css"/>
        <link rel="stylesheet" href="/css/admin-analytics.css"/>
        <title>JSP Page</title>
    </head>    
    <body>
        <c:if test="${sessionScope.roleId ne '4'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Admin Dashboard</h3>
                <ul>
                    <li onclick="changeLocation('/home')"> <i class="fa-solid fa-house"></i> Home</a></li>
                    <li onclick="changeLocation('/admin')"> <i class="fa-solid fa-chart-simple"></i> Analytics</a></li>
                    <li onclick="changeLocation('/admin-manage-user')"> <i class="fa-solid fa-users"></i> User Manager</a></li>
                    <li onclick="changeLocation('/admin-manage-setting')"> <i class="fa-solid fa-gear"></i> Setting</a></li>
                </ul>
            </div> 

            <div class="analytic-container" style="width: 80%; margin-left: 20%;">
                <h1>Dashboard</h1>
                <div class="number-total-container">
                    <div class="number-total-item reservation" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Reservation</h3>
                            <h4 class="number-total-item-number">${totalNumberOfBooking}</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-list-check"></i>
                        </div>
                    </div>
                    <div class="number-total-item earning" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Earning</h3>
                            <h4 class="number-total-item-number">${totalMoney} đ</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-money-bill"></i>
                        </div>
                    </div>
                    <div class="number-total-item feedback" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Feedback</h3>
                            <h4 class="number-total-item-number">84%</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-comments"></i>
                        </div>
                    </div>
                    <div class="number-total-item user" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Users</h3>
                            <h4 class="number-total-item-number">${totalUser}</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-user"></i>
                        </div>
                    </div>
                </div>

                <div class="chart-container">
                    <div class="user-chart-container">
                        <div class="chart-item" >
                            <div class="chart-item-detail">
                                Number of User Created
                                <label for="week-dropdown"></label>
                                <input type="week" id="week-dropdown" placeholder="Choose week"/>
                            </div>
                            <div style="width: 100%; height: 90%; padding: 10px;">
                                <canvas id="user-line-chart" width="10" height=""></canvas>
                            </div>
                        </div>
                        <div class="chart-item">
                            <div class="chart-item-detail">
                                Users Overview
                            </div>
                            <div style="width: 100%; height: 90%;">
                                <canvas id="user-pie-chart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="reservation-chart-container">

                    </div>
                </div>
            </div>
        </div>

        <div id="data-user" data-user='[
             <c:forEach items="${listUser}" var="u" varStatus="loop">
                 {
                 "userId": ${u.getUserId()},
                 "status": ${u.getStatus()},
                 "roleId": ${u.getRoleId()},
                 "createdAt": "${u.getCreatedAt()}"
                 }<c:if test="${!loop.last}">,</c:if>
             </c:forEach>
             ]' hidden style="display: none">
        </div>



        <script src="./js/filter_Popup.js"></script>
        <script>
                        function changeLocation(url) {
                            window.location.href = url;
                        }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="./js/admin_dashboard_chart.js"></script>
    </body>
</html>
