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


        <div class="popup" style="display: none;">
            <div class="filter-container" id="add-newuser-container" style="display: none;">
                <form action="">
                    <div class="filter-title">
                        <h1>Add New Reservation</h1>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label for="username">User Name</label></td>
                                <td><input type="username" placeholder="Enter User Name..." id="username"></td>
                            </tr>
                            <tr>
                                <td><label for="email">Email</label></td>
                                <td><input type="email" placeholder="Enter Email..." id="email"></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><input type="address" placeholder="Enter Address..." id="address"></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone</label></td>
                                <td><input type="phone" placeholder="Enter phone..." id="phone"></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth</td>
                                <td><input type="date" name="dobFrom" id="dobFrom"></td>
                            </tr>
                            <tr>
                                <td>
                                    Role
                                    <select name="" id="">
                                        <option value="">Choose Role</option>
                                        <option value="">Admin</option>
                                        <option value="">Manager</option>
                                        <option value="">Staff</option>
                                        <option value="">Customer</option>
                                        <option value="">Guest</option>
                                    </select>
                                </td>
                                <td>
                                    Status
                                    <select name="" id="">
                                        <option value="">Choose Status</option>
                                        <option value="">Active</option>
                                        <option value="">Banned</option>
                                    </select>

                                    Gender
                                    <select name="" id="">
                                        <option value="">Choose Gender</option>
                                        <option value="">Male</option>
                                        <option value="">Female</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="filter-btn">
                        <button id="cancel-btn">Cancel</button>
                        <button id="add-user-btn">Add</button>
                    </div>
                </form>
            </div>

            <div class="filter-container" id="filter-container" style="display: none;">
                <form action="">
                    <div class="filter-title">
                        <h1>Filter Option</h1>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label for="username">User Name</label></td>
                                <td><input type="username" placeholder="Enter User Name..." id="username"></td>
                            </tr>
                            <tr>
                                <td><label for="email">Email</label></td>
                                <td><input type="email" placeholder="Enter Email..." id="email"></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><input type="address" placeholder="Enter Address..." id="address"></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone</label></td>
                                <td><input type="phone" placeholder="Enter phone..." id="phone"></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth From</td>
                                <td><input type="date" name="dobFrom" id="dobFrom"> To <input type="date" name="dobTo"
                                                                                              id="dobTo"></td>
                            </tr>
                            <tr>
                                <td>Created From</td>
                                <td><input type="date" name="dobFrom" id="dobFrom"> To <input type="date" name="dobTo"
                                                                                              id="dobTo"></td>
                            </tr>
                            <tr>
                                <td>
                                    Role
                                    <select name="" id="">
                                        <option value="">Choose Role</option>
                                        <option value="">Admin</option>
                                        <option value="">Manager</option>
                                        <option value="">Staff</option>
                                        <option value="">Customer</option>
                                        <option value="">Guest</option>
                                    </select>
                                </td>
                                <td>
                                    Status
                                    <select name="" id="">
                                        <option value="">Choose Status</option>
                                        <option value="">Active</option>
                                        <option value="">Banned</option>
                                    </select>

                                    Gender
                                    <select name="" id="">
                                        <option value="">Choose Gender</option>
                                        <option value="">Male</option>
                                        <option value="">Female</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="filter-btn">
                        <button id="cancel-btn">Cancel</button>
                        <button id="filter-btn">Filter</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Admin Dashboard</h3>
                <ul>
                    <li id="analyticsMenu"><i class="fa-solid fa-chart-simple"></i>Analytics</li>
                    <li id="reservationManager"><i class="fa-solid fa-users"></i>Reservation Manager</li>
                    <li id="manageCustomer"><i class="far fa-angry"></i><a href="manageCustomer" style="text-decoration: none;color: white;">Customer Manager</a></li>
                    <li id="manageService"><i class="far fa-angry"></i><a href="manageService" style="text-decoration: none;color: white;" >Service Manager</a></li>
                    <li><i class="fa-solid fa-gear"></i>Setting</li>
                </ul>
            </div>

            <div class="user-container">
                <div class="user-list-container">
                    <h1 class="user-container-table">List User</h1>
                    <div class="top-option">
                        <form action="" class="search-name-form">
                            <input type="text" placeholder="Enter name of User...">
                            <button><i class="fa-solid fa-magnifying-glass"></i> Search</button>
                            <button id="btn-show-filter"><i class="fa-solid fa-filter"></i> Filter</button>
                        </form>
                        <button id="addNewUser"><i class="fa-solid fa-user-plus"></i> Add New User</button>
                    </div>


                    <div id="container">
                        <div class = "charts">
                            <div id="chartsContainer" ></div>
                            <select id="weekSelector"></select>
                        </div>
                        <canvas class="chart" id="statusPieChart" style="display: block; box-sizing: border-box; height: 100; width: 100;">hg</canvas>
                    </div>

                    <div id="reservationsContainer" style="display: none;">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Booking Id</th>
                                    <th>Status</th>
                                    <th>Slot</th>
                                    <th>SlotStatus</th>
                                    <th>Doctor Name</th>    
                                    <th>Customer Name</th>
                                    <th>Date</th>
                                    <th>Actions</th>
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





                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script src="js/managerDashboard.js"></script>
    </body>

</html>