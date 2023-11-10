<%-- 
    Document   : updateFeedback
    Created on : Nov 8, 2023, 6:35:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form action="feedbackupdate" method="post">
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
                    <div class="form-group col-md-4">
                        <label for="rate">Rating</label>
                        <select id="rate" class="form-control" name="rate">
                            <option selected>${feedbackUpdate.getRatingValue()}</option>
                            <option>Excellent</option>
                            <option>Good</option>
                            <option>Medium</option>
                            <option>Poor</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="comment">Comment</label>
                    <textarea
                        class="form-control"
                        id="comment"
                        readonly>${feedbackUpdate.getComment()}
                    </textarea>
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
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
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
