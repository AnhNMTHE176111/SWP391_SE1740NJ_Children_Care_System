<%-- 
    Document   : updateFeedback
    Created on : Nov 8, 2023, 6:35:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
        <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet"
            />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="float: left; margin-top: 20px">
                    <button class="btn btn-primary"><a href="/manageDashboard" style="text-decoration: none; color: white">Back</a></button>
                </div>
            </div>
            <div class="row" style="display: flex; justify-content: center">
                <c:choose>
                    <c:when test="${mess1 != null}">
                        <h1 style="color: red">${mess1}</h1>
                    </c:when>
                    <c:otherwise>
                        <form action="feedbackupdate" method="post" style="border: 1px solid #EDEFF2; padding: 15px">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="bookingId">Booking Id</label>
                                    <input
                                        class="form-control"
                                        id="bookingId"
                                        value="${feedbackUpdate.getBookingId()}"
                                        readonly
                                        />
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="rate">Rating</label>
                                    <select id="rate" class="form-control" name="rate">
                                        <option selected>${feedbackUpdate.getRatingValue()}</option>
                                        <option>Excellent</option>
                                        <option>Good</option>
                                        <option>Average</option>
                                        <option>Poor</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment">Comment</label>
                                <input type="text" class="form-control"
                                       id="comment"
                                       name="comment"
                                       value="${feedbackUpdate.getComment()}">
                                <div>
                                    <input type="text" class="form-control" id="ratingId" name="ratingId" value="${feedbackUpdate.getRatingId()}" hidden>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="ufirstname">User First Name</label>
                                    <input type="text" class="form-control" id="ufirstname" value="${feedbackUpdate.getUserFirstName()}" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="ulastname">User Last Name</label>
                                    <input type="text" class="form-control" id="ulastname" value="${feedbackUpdate.getUserLastName()}" readonly>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="dfirstname">Doctor First Name</label>
                                    <input type="text" class="form-control" id="dfirstname" value="${feedbackUpdate.getDoctorFirstName()}" readonly>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="dlastname">Doctor Last Name</label>
                                    <input type="text" class="form-control" id="dlastname" value="${feedbackUpdate.getDoctorLastName()}" readonly>
                                </div>
                            </div>
                            <p style="color: green">${mess}</p>
                            <button type="submit" name="update" class="btn btn-primary">Update</button>
                            <button type="submit" name="delete" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')">Delete</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            var select = document.getElementById("rate");
                            var selectedValue = "${feedbackUpdate.getRatingValue()}";

                            for (var i = 1; i < select.options.length; i++) {
                                if (select.options[i].value === selectedValue) {
                                    select.remove(i);
                                    break;
                                }
                            }
                        });
    </script>
</html>
