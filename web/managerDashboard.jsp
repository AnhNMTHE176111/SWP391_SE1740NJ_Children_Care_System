<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "DAO.DAOBooking" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "model.Booking" %>
<%@page import= "model.Slot" %>
<%@page import= "model.Doctor" %>
<%@page import= "model.Specialty" %>
<%@page import= "model.Service" %>
<%@page import= "model.SlotDoctor" %>
<%@page import= "DAO.DAOSlotDoctor" %>
<%@page import= "DAO.DAOSlot" %>
<%@page import= "DAO.DAODoctor" %>
<%@page import= "DAO.DAOSpecialty" %>
<%@page import= "DAO.DAOService" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/managerDashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <title>Document</title>
    </head>

    <body>


        <div id="serviceList" style="display: none;"
             data-serviceList='[
             <c:forEach var="rs" items="${serviceList}" varStatus="loop">
                 {"SpecialtyId": "${rs.getDoctorId()}", "ServiceId": "${rs.getServiceId()}", "ServiceName": "${rs.getServiceName()}"}<c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>


        <div id="specialtyList" style="display: none;"
             data-specialtyList='[
             <c:forEach var="rs" items="${specialtyList}" varStatus="loop">
                 {"SpecialtyId": "${rs.getSpecialtyId()}", "SpecialtyName": "${rs.getSpecialtyName()}"}<c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>

        <div id="slotList" style="display: none;"
             data-slotList='[
             <c:forEach var="rs" items="${slotList}" varStatus="loop">
                 {"SlotId": "${rs.slotId}", "StartTime": "${rs.startTime}"}<c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>

        <div id="bookingList" style="display: none;"
             data-bookingList='[
             <c:forEach var="rs" items="${reservationList}" varStatus="loop">
                 {"BookingId": ${rs.getBookingId()}, "BookingStatus": ${rs.getStatus()}, "Day": "${rs.getDay()}"}
                 <c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>

        <div id="bookedSlotsData" style="display: none;"
             data-booked-slots='[
             <c:forEach var="slot" items="${availeSlot}" varStatus="loop">
                 {"DoctorId": ${slot.getDoctorId()}, "SlotId": ${slot.getSlotId()}, "Day": "${slot.getDay()}"}
                 <c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>


        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Manager Dashboard</h3>
                <ul>
                    <li id="analyticsMenu">
                        <i class="fa-solid fa-chart-simple"></i>Analytics
                    </li>
                    <li id="reservationManager">
                        <i class="fa-solid fa-users"></i>Reservation Manager
                    </li>
                    <li id="doctorManager"><i class="fa-solid fa-gear"></i>Doctors Manage</li>
                    <li>
                        <a href="/managePost">
                            <i class="fa-solid fa-gear"></i> Manage Post
                        </a>
                    </li>

                    <li id="manageCustomer"><i class="far fa-angry"></i><a href="manageCustomer" style="text-decoration: none;color: white;">Customer Manager</a></li>
                    <li id="manageService"><i class="far fa-server"></i><a href="manageService" style="text-decoration: none;color: white;" >Service Manager</a></li>
                </ul>
            </div>

            <div class="analytic-container" style="width: 80%; margin-left: 20%;">
                <h1>Dashboard</h1>
                <div class="number-total-container">
                    <div class="number-total-item" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Reservation</h3>
                            <h4 class="number-total-item-number">1780</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-list-check"></i>
                        </div>
                    </div>
                    <div class="number-total-item" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Earning</h3>
                            <h4 class="number-total-item-number">$ 120.00</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-money-bill"></i>
                        </div>
                    </div>
                    <div class="number-total-item" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">Feedback</h3>
                            <h4 class="number-total-item-number">84%</h4>
                        </div>
                        <div class="total-item-logo">
                            <i class="fa-solid fa-comments"></i>
                        </div>
                    </div>
                    <div class="number-total-item" style="display: flex;">
                        <div class="number-total-item-detail">
                            <h3 class="number-total-item-title">User</h3>
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
                                Number of Booking Created
                                <select id="week-dropdown"></select>

                            </div>
                            <div style="width: 100%; height: 90%; padding: 10px;">
                                <canvas id="user-line-chart" width="10" height=""></canvas>
                            </div>
                        </div>
                        <div class="chart-item">
                            <div class="chart-item-detail">
                                Booking Overview
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




            <div class="reservation-manager-container" style="width: 100%; margin-left: 15%; display: none;">
                <div class="user-list-container">
                    <h1 class="user-container-table"> Reservation Manage</h1>
                    <div class="top-option">
                        <form action="admin-manage-user" class="search-name-form" method="post">

                            <input type="text" id="searchInputUser" placeholder="Enter name of User..." onkeyup="searchByUserName()">
                            <input type="text" id="searchInputDoctor" placeholder="Enter name of Doctor..." onkeyup="searchByDoctorName()">
                            <button id="btn-show-filter"><i class="fa-solid fa-filter"></i> Filter</button>
                        </form>
                        <button id="submitAllChanges"><i class="fa-solid fa-user-plus"></i> Submit all Change</button>

                    </div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Booking Id</th>
                                <th>Status</th>
                                <th>Slot</th>
                                <th>SlotStatus</th>
                                <th>Doctor Name</th>s
                                <th>Customer Name</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rs" items="${reservationListForManage}">
                                <tr>
                                    <td>
                                        <span class="editable">${rs.bookingId}</span>
                                        <input type="hidden" name="bookingId" class="hidden-input" value="${rs.bookingId}" />
                                    </td>
                                    <td style="display: none;">
                                        <span class="editable">${rs.doctorId}</span>
                                        <input type="hidden" name="doctorId" class="hidden-input" value="${rs.doctorId}" />
                                    </td>

                                    <td>
                                        <span class="editable">${rs.bookingStatus}</span>
                                        <input type="hidden" name="status" class="hidden-input" value="${rs.bookingStatus}" />
                                    </td>
                                    <td>
                                        <span class="editable">${rs.getStartTime()}</span>
                                        <input type="hidden" name="startTime" class="hidden-input" value="${rs.getStartTime()}" onchange="dropdowId(this)" />
                                    </td>

                                    <td>
                                        <span class="editable">${rs.status}</span>
                                        <input type="hidden" name="slotStatus" class="hidden-input" value="${rs.status}" />
                                    </td>
                                    <td>
                                        <span class="editable">${rs.doctorName}</span>
                                        <input type="hidden" name="doctorName" class="hidden-input" value="${rs.doctorName}" />
                                    </td>
                                    <td>
                                        <span class="editable">${rs.customerName}</span>
                                        <input type="hidden" name="customerName" class="hidden-input" value="${rs.customerName}" />
                                    </td>
                                    <td>
                                        <span class="editable">${rs.day}</span>
                                        <input type="hidden" name="day" class="hidden-input" value="${rs.day}" />
                                    </td>
                                    <td>
                                        <button onclick="makeEditable(this);"><i class="fa-solid fa-user-pen"></i>Update</button>
                                        <button onclick="deleteBooking(${rs.bookingId});"><i class="fa-solid fa-user-pen"></i>Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="doctor-manager-container" style="width: 100%; margin-left: 15%; display: none;">


                <div class="user-list-container">
                    <h1 class="user-container-table"> Doctor Manage</h1>
                    <div class="top-option">
                        <form action="admin-manage-user" class="search-name-form" method="post">

                            <input type="text" id="searchInputUser" placeholder="Enter name of User..." onkeyup="searchByUserName()">
                            <input type="text" id="searchInputDoctor" placeholder="Enter name of Doctor..." onkeyup="searchByDoctorName()">
                            <button id="btn-show-filter"><i class="fa-solid fa-filter"></i> Filter</button>
                        </form>
                        <button id="addDoctor"><i class="fa-solid fa-user-plus"></i> Add new Doctor</button>

                    </div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Doctor</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rs" items="${doctorList}">
                                <tr>
                                    <td>${rs.getDoctorId()}</td>
                                    <td>${rs.getName()}</td>
                                    <td>
                                        <button class="update-button" onclick="changeSlot(${rs.doctorId});"><i class="fa-solid fa-user-pen"></i>Select to disable</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>







                </div>


            </div>

            <div id="newDoctorModal" class="modal" style="display:none;">
                <form id="addDoctorForm">
                    <div class="form-left-column">
                        <h2>Bảng Đăng Ký Bác Sĩ</h2>
                        <label for="doctorAvatar">Avatar:</label>

                        <input type="file" id="doctorAvatar" name="doctorAvatar" accept="image/*"><br>

                        <label for="doctorName">Name:</label>
                        <input type="text" id="doctorName" name="doctorName" required><br>

                        <label for="doctorGender">Gender:</label>
                        <select id="doctorGender" name="doctorGender" required>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select><br>

                        <label for="doctorDob">Date of Birth:</label>
                        <input type="date" id="doctorDob" name="doctorDob" required><br>

                        <label for="doctorSpecialization">Specialization:</label>
                        <select id="doctorSpecialization" name="doctorSpecialization" required>
                            <c:forEach var="rs" items="${specialtyList}" varStatus="loop">
                                <option value="${rs.getSpecialtyId()}">${rs.getSpecialtyName()}</option>
                            </c:forEach>
                        </select><br>

                        <label for="doctorService">Service:</label>
                        <select id="doctorService" name="doctorService" required>

                        </select><br>

                        <label for="doctorPhone">Phone Number:</label>
                        <input type="tel" id="doctorPhone" name="doctorPhone" required><br>
                    </div>
                    <div class="form-right-column rightSide">

                        <label for="doctorEmail" >Email:</label>
                        <input type="email" id="doctorEmail" name="doctorEmail" required><br>

                        <label for="doctorPassword">Password:</label>
                        <input type="password" id="doctorPassword" name="doctorPassword" required><br>

                        <label for="doctorPosition">Position:</label>
                        <input type="text" id="doctorPosition" name="doctorPosition" required><br>

                        <label for="doctorAddress">Address:</label>
                        <input type="text" id="doctorAddress" name="doctorAddress"><br>

                        <label for="doctorDescription">Description: </label>
                        <input type="text" id="doctorDescription" name="doctorDescription"><br>

                        <label for="doctorExperience">Years of Experience:</label>
                        <input type="number" id="doctorExperience" name="doctorExperience" min="0" step="1"><br>
                    </div>
                    <input type="submit" value="Submit">
                    <button type="button" id="closeModal">Close</button>
                </form>

            </div>

            <div id="updateForm" style="display: none;">
                <h2>Bảng Đăng Ký Slot</h2>
                <label for="updateDate">Ngày:</label>
                <input type="date" id="updateDate" name="updateDate"><br>

                <label for="updateDescription">Description:</label>
                <input type="text" id="updateDescription" name="updateDescription"><br> <!-- Thêm dòng này -->

                <label for="updateSlots">Danh sách slot:</label>
                <div class="date-hidden">
                    <div class="date">
                        <c:forEach var="slot" items="${slotList}">
                            <button class="grid-date" name="slot" data-slot-id="${slot.slotId}" onclick="onSlotSelect(this)">${slot.startTime}</button>
                        </c:forEach>
                    </div>
                </div>
                <!-- Nút Save -->
<button class="save" onclick="updateDoctorSlot();">Save</button>
<!-- Nút Close -->
<button type="button" class="close" id="closeSlotSelect">Close</button>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script src="js/managerDashboard.js"></script>
    </body>

</html>