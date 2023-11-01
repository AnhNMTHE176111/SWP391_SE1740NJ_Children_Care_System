<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import= "DAO.DAOBooking" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "model.Booking" %>
<%@page import= "model.Slot" %>
<%@page import= "model.SlotDoctor" %>
<%@page import= "DAO.DAOSlotDoctor" %>
<%@page import= "DAO.DAOSlot" %>

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
                    <li><i class="fa-solid fa-gear"></i>Setting</li>
                    <li>
                        <a href="/managePost">
                            <i class="fa-solid fa-gear"></i> Manage Post
                        </a>
                    </li>

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
                                Number of User Created
                                <select id="week-dropdown"></select>

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


            <div class="reservation-manager-container" style="width: 100%; margin-left: 15%; display: none;">
                <div class="user-list-container">
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="js/managerDashboard.js"></script>
    </body>

</html>