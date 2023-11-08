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
                <form action="manageAddService" method="post">
                    <div class="filter-title">
                        <h1>Service Information</h1>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label for="Doctor">Doctor</label></td>
                                <td>
                                    <select name="Doctor" id="Doctor">
                                        <c:forEach var="listDoctor" items="${listDoctor}">
                                            <option value="${listDoctor.getDoctorId()}" >
                                                ${listDoctor.getLastname()} ${listDoctor.getFirstname()}
                                            </option>            
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="email">Service Name</label></td>
                                <td><input type="text" name="serviceName" placeholder="Enter Service Name..." id="email"
                                           required value="${service.getServiceName()}" ></td>
                            </tr>
                            <tr>
                                <td><label for="price">Price</label></td>
                                <td><input type="address" name="price" placeholder="Enter Price..." id="address"
                                           required value="${service.getPrice()}"></td>
                            </tr>
                            <tr>
                                <td><label for="Description">Description</label></td>
                                <td><input type="text" name="description" placeholder="Enter Price..." id="address"
                                           required value="${service.getPrice()}"></td>
                            </tr>

                        </tbody>
                    </table>

                    <h2 style="color: red">${mess}</h2>
                    <h2 style="color: green">${mess1}</h2>

                    <div class="add-user-btn-container">
                        <div>
                            <button id="add-user-btn" type="submit" onclick="showUpdateAlert()">Add</button>
                        </div>
                        <div>
                            <button id="add-user-btn" type="reset" onclick="changeLocation('/manageService')" style="">Back To List Service</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            function changeLocation(url) {
                window.location.href = url;
            }
            function showUpdateAlert() {
                alert("Add service successfully!");
            }
        </script>
    </body>
</html>
