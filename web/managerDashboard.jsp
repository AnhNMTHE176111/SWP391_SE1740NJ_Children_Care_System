<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import= "DAO.DAOBooking" %>
<%@page import= "java.util.ArrayList" %>
<%@page import= "model.Booking" %>

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
        <div id="bookingList" style="display: none;"
             data-bookingList='[
             <c:forEach var="rs" items="${reservationList}" varStatus="loop">
                 {"BookingId": ${rs.getBookingId()}, "BookingStatus": ${rs.getStatus()}, "Day": "${rs.getDay()}"}
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
                    <li id="analyticsMenu"><i class="fa-solid fa-chart-simple"></i>Analytics</li>
                    <li id="reservationManager"><i class="fa-solid fa-users"></i>Reservation Manager</li>
                    <li id="feedbackManager"><i class="fa-solid fa-comments"></i>Feedback Manager</li>
                    <li id="manageCustomer"><i class="far fa-angry"></i><a href="manageCustomer" style="text-decoration: none;color: white;">Customer Manager</a></li>
                    <li id="manageService"><i class="far fa-server"></i><a href="manageService" style="text-decoration: none;color: white;" >Service Manager</a></li>
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
                            <input type="text" name="username" placeholder="Enter name of User...">
                            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
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
                                    <td>
                                        <span class="editable">${rs.status}</span>
                                        <input type="hidden" name="status" class="hidden-input" value="${rs.status}" />
                                    </td>
                                    <td>
                                        <span class="editable">${rs.getStartTime()}</span>
                                        <input type="hidden" name="startTime" class="hidden-input" value="${rs.getStartTime()}" />
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

                                </thead>
                            <tbody>
                                <c:forEach var="rs" items="${reservationListForManage}">
                                    <tr>
                                        <td><span class="editable">${rs.bookingId}</span><input type="hidden" class="hidden-input" value="${rs.bookingId}" /></td>
                                        <td><span class="editable">${rs.status}</span><input type="hidden" class="hidden-input" value="${rs.status}" /></td>
                                        <td><span class="editable">${rs.getStartTime()}</span><input type="hidden" class="hidden-input" value="${rs.getStartTime()}" /></td>
                                        <td><span class="editable">${rs.status}</span><input type="hidden" class="hidden-input" value="${rs.status}" /></td>
                                        <td><span class="editable">${rs.doctorName}</span><input type="hidden" class="hidden-input" value="${rs.doctorName}" /></td>
                                        <td><span class="editable">${rs.customerName}</span><input type="hidden" class="hidden-input" value="${rs.customerName}" /></td>
                                        <td><span class="editable">${rs.day}</span><input type="hidden" class="hidden-input" value="${rs.day}" /></td>
                                        <td>
                                            <button onclick="makeEditable(this);">Update</button>
                                            <button onclick="deleteBooking(${rs.bookingId});">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div id="feedbackContainer" style="display: none;">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Booking Id</th>
                                    <th>Rating</th>
                                    <th>Comment</th>
                                    <th>Customer Name</th>
                                    <th>Doctor Name</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="mf" items="${listManageFeedback}">
                                    <tr>
                                        <td><span class="editable">${mf.bookingId}</span><input type="hidden" class="hidden-input" value="${mf.bookingId}" /></td>
                                        <td><span class="editable">${mf.ratingValue}</span><input type="hidden" class="hidden-input" value="${mf.ratingValue}" /></td>
                                        <td><span class="editable">${mf.comment}</span><input type="hidden" class="hidden-input" value="${mf.comment}" /></td>
                                        <td><span class="editable">${mf.userFirstName} ${mf.userLastName}</span><input type="hidden" class="hidden-input" value="${mf.userFirstName} ${mf.userLastName}" /></td>
                                        <td><span class="editable">${mf.doctorFirstName} ${mf.doctorLastName}</span><input type="hidden" class="hidden-input" value="${mf.doctorFirstName} ${mf.doctorLastName}" /></td>
                                        <td>
                                            <button type="submit"><a href="/feedbackupdate?get&id=${mf.ratingId}" style="text-decoration: none;">Detail</a></button>
                                            <button type="submit">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>


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