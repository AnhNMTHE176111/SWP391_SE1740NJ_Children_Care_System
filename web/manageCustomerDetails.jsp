<%-- 
    Document   : admin_Dashboard_AddNewUser
    Created on : Oct 15, 2023, 3:35:55 PM
    Author     : dmx
--%>

<%--
Document   : admin_Dashboard_AddNewUser
Created on : Oct 15, 2023, 3:35:55 PM
Author     : dmx
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css" />
    <title>JSP Page</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h1 class="card-title">Profile User</h1>
                        <form action="manageCustomerDetails" method="post">
                            <input type="text" name="userId" readonly value="${currentCustomer.getUserId()}" style="display: none">
                            <div class="form-group">
                                <label for="firstname">First Name</label>
                                <input type="text" name="firstname" class="form-control" placeholder="Enter First Name..."
                                    id="firstname" required value="${currentCustomer.getFirstName()}">
                            </div>
                            <div class="form-group">
                                <label for="lastname">Last Name</label>
                                <input type="text" name="lastname" class="form-control" placeholder="Enter Last Name..."
                                    id="lastname" required value="${currentCustomer.getLastName()}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Enter Email..." id="email"
                                    required value="${currentCustomer.getEmail()}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="address" class="form-control" placeholder="Enter Address..." id="address"
                                    required value="${currentCustomer.getAddress()}">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" name="phone" class="form-control" placeholder="Enter phone..." id="phone"
                                    required value="${currentCustomer.getPhone()}">
                            </div>
                            <div class="form-group">
                                <label for="dob">Date Of Birth</label>
                                <input type="date" name="dob" class="form-control" id="dob" value="${currentCustomer.getDob()}">
                            </div>
                            <div class="form-group">
                                <label for="createdAt">Created At</label>
                                <input type="date" name="createdAt" class="form-control" id="createdAt"
                                    value="${currentCustomer.getCreatedAt()}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select name="status" class="form-control" id="status" required>
                                    <option>Choose Status</option>
                                    <option value="1" ${currentCustomer.getStatus() eq 1 ? 'selected' : ''}>Active</option>
                                    <option value="0" ${currentCustomer.getStatus() eq 0 ? 'selected' : ''}>Banned</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select name="gender" class="form-control" id="gender" required>
                                    <option>Choose Gender</option>
                                    <option value="male" ${currentCustomer.getGender() eq 'male' ? 'selected' : ''}>Male</option>
                                    <option value="female" ${currentCustomer.getGender() eq 'female' ? 'selected' : ''}>Female</option>
                                </select>
                            </div>
                            <h2 style="color: red">${mess}</h2>
                            <h2 style="color: green">${mess1}</h2>
                            <div class="text-center">
                                <button class="btn btn-primary" type="submit">Update</button>
                                <button class="btn btn-secondary" type="button" onclick="changeLocation('/manageCustomer')">Back To List Customer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h1 class="card-title">Reservation History</h1>
                        <c:choose>
                            <c:when test="${empty listReservation}">
                                <p>Do not have any reservation</p>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Service Name</th>
                                            <th>Doctor Name</th>
                                            <th>Status</th>
                                            <th>Visit date</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reservation" items="${listReservation}">
                                            <tr>
                                                <td>${reservation.getServiceName()}</td>
                                                <td>${reservation.getDoctorName()}</td>
                                                <td>${reservation.getBookingStatus()}</td>
                                                <td>${reservation.getDate()}</td>
                                                <td>${reservation.getStartTime()}</td>
                                                <td>${reservation.getEndTime()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
