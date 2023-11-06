<%-- Document : admin_Setting Created on : Nov 5, 2023, 9:01:04 PM Author : dmx --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServlet" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css" />
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>

    <body>
        <c:if test="${sessionScope.roleId ne '4'}">
            <jsp:forward page="403.jsp" />
        </c:if>
        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Admin Dashboard </h3>
                <ul>
                    <li onclick="changeLocation('/home')"> <i class="fa-solid fa-house"></i>
                        Home</a></li>
                    <li onclick="changeLocation('/admin')"> <i
                            class="fa-solid fa-chart-simple"></i> Analytics</a></li>
                    <li onclick="changeLocation('/admin-manage-user')"> <i
                            class="fa-solid fa-users"></i> User Manager</a></li>
                    <li onclick="changeLocation('/admin-manage-setting')"> <i
                            class="fa-solid fa-gear"></i> Setting</a></li>
                </ul>
            </div>

            <div class="user-container" style="width: 100%; margin-left: 15%">
                <div class="user-list-container">
                    <h1 class="user-container-table"> Setting Management</h1>
                </div>
                <div class="col-12 d-flex justify-content-center mx-5 my-2">
                    <div class="col-5 mx-1 mb-3">
                        <h3 class="mx-3 my-2">1. Set Date Off:</h3>
                        <div class="col-10">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>DateID</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listDate}" var="item">
                                        <tr>
                                            <td>${item.getKey()}</td>
                                            <td>${item.getValue()}</td>
                                            <td>
                                                <button class="btn btn-danger"
                                                        onclick="changeLocation(`dateConfigController?mode=delete&id=${item.getKey()}`)">
                                                    Remove
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <tr>
                                <form action="dateConfigController">
                                    <td colspan="2">
                                        <input type="date" class="form-control"
                                               name="date" required="" />
                                    </td>
                                    <td>
                                        <button class="btn btn-primary"
                                                type="submit">Add</button>
                                    </td>
                                </form>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-5">

                        <div class="col-10 mx-2 my-2 mb-5">
                            <h3 class="mx-3">2. Set Number of Appointment Date:</h3>
                            <div class="col-12">
                                <div class="col-10">
                                    <form action="numberConfig" method="POST">
                                        <label
                                            for="numOfAppointment font-weight-bold">Number:
                                        </label>
                                        <div class="d-flex">
                                            <input type="number" class="form-control"
                                                   name="num" id="numOfAppointment"
                                                   value="${num}" required="" min="1" max="7">
                                            <button class="mx-3 btn btn-success"
                                                    type="submit">Set</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-10 mx-2 my-2">
                            <h3 class="mx-3">3. System maintenance for roles:</h3>
                            <div class="col-12">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Staff</td>
                                            <td>
                                                <button
                                                    class="btn btn-danger">Remove</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <script>
            function changeLocation(url) {
                window.location.href = url;
            }
        </script>
    </body>

</html>