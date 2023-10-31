<%-- 
    Document   : admin_Dashboard_AddNewUser
    Created on : Oct 15, 2023, 3:35:55 PM
    Author     : dmx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.roleId ne '3'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <div class="dashboard-container">


            <div class="filter-container" id="add-newuser-container" style="display: flex;">
                <form action="addCustomer" method="post">
                    <div class="filter-title">
                        <h1>Add New Customer</h1>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label for="username">First Name</label></td>
                                <td><input type="text" name="firstname" placeholder="Enter First Name..."
                                           id="username" required></td>
                            </tr>
                            <tr>
                                <td><label for="username">Last Name</label></td>
                                <td><input type="text" name="lastname" placeholder="Enter Last Name..."
                                           id="username" required></td>
                            </tr>
                            <tr>
                                <td><label for="email">Email</label></td>
                                <td><input type="email" name="email" placeholder="Enter Email..." id="email"
                                           required></td>
                            </tr>
                            <tr>
                                <td><label for="password">Password</label></td>
                                <td><input type="password" name="password" placeholder="Enter password..."
                                           id="password" required></td>
                            </tr>
                            <tr>
                                <td><label for="repassword">Repeat Password</label></td>
                                <td><input type="password" name="repassword" placeholder="Repeat Password..."
                                           id="repassword" required></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><input type="address" name="address" placeholder="Enter Address..." id="address"
                                           required></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone</label></td>
                                <td><input type="phone" name="phone" placeholder="Enter phone..." id="phone"
                                           required></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth</td>
                                <td><input type="date" name="dob" id="dobFrom"></td>
                            </tr>
                            <tr>
                                <td>
                                    Status
                                    <select name="status" id="" required>
                                        <option>Choose Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Banned</option>
                                    </select>
                                </td>
                                <td>
                                    Gender
                                    <select name="gender" id="" required>
                                        <option>Choose Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <h2 style="color: red">${mess}</h2>
                    <h2 style="color: green">${mess1}</h2>

                    <div class="add-user-btn-container">
                        <div>
                            <button id="add-user-btn" type="submit" style="">Add New User</button>

                        </div>
                        <div>
                            <button id="cancel-btn" type="reset">Cancel</button>
                            <button id="add-user-btn" onclick="changeLocation('/manageCustomer')" style="">Back To List User</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            function changeLocation(url) {
                window.location.href = url;
            }
        </script>
    </body>
</html>
