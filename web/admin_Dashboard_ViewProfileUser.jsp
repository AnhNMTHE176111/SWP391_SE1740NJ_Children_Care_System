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

            <div class="filter-container" id="add-newuser-container" style="display: flex;">
                <form action="admin-view-profile-user" method="post">
                    <div class="filter-title">
                        <h1>Profile User</h1>
                    </div>
                    <table>
                        <input type="text" name="userId" readonly value="${userViewing.getUserId()}" style="display: none">
                        <tbody>
                            <tr>
                                <td><label for="username">First Name</label></td>
                                <td><input type="text" name="firstname" placeholder="Enter First Name..."
                                           id="username" required value="${userViewing.getFirstName()}"></td>
                            </tr>
                            <tr>
                                <td><label for="username">Last Name</label></td>
                                <td><input type="text" name="lastname" placeholder="Enter Last Name..."
                                           id="username" required value="${userViewing.getLastName()}"></td>
                            </tr>
                            <tr>
                                <td><label for="email">Email</label></td>
                                <td><input type="email" name="email" placeholder="Enter Email..." id="email"
                                           required value="${userViewing.getEmail()}" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><input type="address" name="address" placeholder="Enter Address..." id="address"
                                           required value="${userViewing.getAddress()}"></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone</label></td>
                                <td><input type="phone" name="phone" placeholder="Enter phone..." id="phone"
                                           required value="${userViewing.getPhone()}"></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth</td>
                                <td><input type="date" name="dob" id="dobFrom" value="${userViewing.getDob()}"></td>
                            </tr>
                            <tr>
                                <td>Created At</td>
                                <td><input type="date" name="createdAt" id="dobFrom" value="${userViewing.getCreatedAt()}" readonly></td>
                            </tr>
                            <tr>
                                <td>
                                    Role
                                    <select name="roleid" id="" required>
                                        <option>Choose Role</option>
                                        <option value="4" ${userViewing.getRoleId() eq 4 ? 'selected' : ''}>Admin</option>
                                        <option value="3" ${userViewing.getRoleId() eq 3 ? 'selected' : ''}>Manager</option>
                                        <option value="2" ${userViewing.getRoleId() eq 2 ? 'selected' : ''}>Staff</option>
                                        <option value="1" ${userViewing.getRoleId() eq 1 ? 'selected' : ''}>Customer</option>
                                        <option value="0" ${userViewing.getRoleId() eq 0 ? 'selected' : ''}>Guest</option>
                                    </select>
                                </td>
                                <td>
                                    Status
                                    <select name="status" id="" required>
                                        <option>Choose Status</option>
                                        <option value="1" ${userViewing.getStatus() eq 1 ? 'selected' : ''}>Active</option>
                                        <option value="0" ${userViewing.getStatus() eq 0 ? 'selected' : ''}>Banned</option>
                                    </select>

                                    Gender
                                    <select name="gender" id="" required>
                                        <option>Choose Gender</option>
                                        <option value="male" ${userViewing.getGender() eq 'male' ? 'selected' : ''}>Male</option>
                                        <option value="female" ${userViewing.getGender() eq 'female' ? 'selected' : ''}>Female</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <h2 style="color: red">${mess}</h2>
                    <h2 style="color: green">${mess1}</h2>

                    <div class="add-user-btn-container">
                        <div>
                            <button id="add-user-btn" type="submit" style="">Update</button>
                        </div>
                        <div>
                            <button id="cancel-btn" type="reset">Cancel</button>
                            <button id="add-user-btn" type="reset" onclick="changeLocation('/admin-manage-user')" style="">Back To List User</button>
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
