<%-- 
    Document   : myReservation
    Created on : Oct 9, 2023, 1:53:39 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href="css/reservation.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h2>My Reservations</h2>
                </div>
                <div class="col-md-12">
                    <table class="table table-reservation">
                        <tr class="table-reservation-row">
                            <th class="table-reservation-header">ID</th>
                            <th class="table-reservation-header">Your service</th>
                            <th class="table-reservation-header">Time to check up</th>
                            <th class="table-reservation-header">Doctor</th>
                            <th class="table-reservation-header">Status</th>
                        </tr>
                        <c:forEach items="${sessionScope.customerReservation}" var="cr">
                            <tr class="table-reservation-row">
                                <td class="table-reservation-column">
                                    <label class="item">${cr.bookingId}</label>
                                </td>
                                <td class="table-reservation-column">
                                    <p class="item item-name">Reservation created at:</p>
                                    <ul class="table-reservation-list">
                                        <li class="item">
                                            <i class="fa-solid fa-calendar-alt"></i> ${cr.bookingCreateDate}
                                        </li>
                                        <li class="item">
                                            <i class="fa-solid fa-clock"></i> ${cr.bookingCreateTime}
                                        </li>
                                    </ul>
                                </td>
                                <td class="table-reservation-column">
                                    <ul class="table-reservation-list">
                                        <li class="item">
                                            <i class="fa-solid fa-disease"></i> ${cr.symptomps}
                                        </li>
                                        <li class="item">
                                            <i class="fa-solid fa-calendar-alt"></i> ${cr.bookingDate}
                                        </li>
                                        <li class="item">
                                            <i class="fa-solid fa-clock"></i>${cr.bookingTime}
                                        </li>
                                    </ul>
                                </td>
                                <td class="table-reservation-column">
                                    <i style="color: white" class="fa-solid fa-user-doctor"></i
                                    ><label class="item"> ${cr.doctorName}</label>
                                </td>
                                <td class="table-reservation-column">
                                    <label class="item">${cr.bookingStatus}</label>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="paging col-md-12">
                    <button
                        class="btn-1"
                        style="background-color: rgb(139, 139, 139); margin-right: 10px"
                        >
                        <i class="fa-solid fa-arrow-left"></i>
                    </button>
                    <button class="btn-1" style="background-color: #17a2b8">
                        <i class="fa-solid fa-arrow-right"></i>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2"><h2>Post</h2></div>
                <div class="post-search col-md-10">
                    <input class="post-search-input" type="text" placeholder="Search" />
                    <button class="btn btn-search" type="submit">
                        <i class="fa-solid fa-magnifying-glass"> </i>
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card">
                        <img
                            src="https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1067&q=80"
                            class="card-img-top"
                            alt="..."
                            />
                        <div class="card-body">
                            <h5 class="card-title">Product Name</h5>
                            <label style="float: left"><i class="fa-solid fa-eye"></i></label>
                            Viewer: 1234 <label style="float: right">Rating:<i></i></label
                            ><br />
                            <p>
                                Neque porro quisquam est qui dolorem ipsum quia dolor sit amet,
                                consectetur, adipisci velit...
                            </p>
                            <a href="#">Read More <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script
        src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
    ></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"
    ></script>
</html>
