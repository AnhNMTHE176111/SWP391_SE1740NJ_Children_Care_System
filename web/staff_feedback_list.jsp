<%-- 
    Document   : staff_feedback_list
    Created on : Nov 7, 2023, 4:13:00 PM
    Author     : ASUS
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServlet" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /*            table {
            margin-left: 140px;
            width: 80%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }*/
            .pending {
                background-color: #FFA500; /* Pumpkin orange color */
                color: white;
                padding: 5px;
                border-radius: 5px;
            }
            .active {
                background-color: green;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

            .inactive {
                background-color: red;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }
            #status {
                padding: 5px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #fff;
                color: #333;
                width: 150px;
            }

            /* Style the select options */
            #status option {
                padding: 10px;
            }

            /* Hover effect for options */
            #status option:hover {
                background-color: #f0f0f0;
            }

            .feedbackcontainer{
                margin-right: 320px;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>

            <h1 style="margin-left: 100px;padding: 40px;">List Reservation </h1>
            <div class="col-12 d-flex justify-content-end feedbackcontainer">
                <form class="feedbackcontainer" action="feedbackstaff" method="GET">
                    <select id="rate" class="feedbackrate" name="rate">
                        <option value= "">All</option>
                        <option value="Excellent">Excellent</option>
                        <option value="Medium">Medium</option>
                        <option value="Good">Good</option>
                        <option value="Poor">Poor</option>
                    </select>
                    <button type="submit">Filter</button>
                </form>
            </div>
            <div class="col-12 d-flex justify-content-center">
                <table id="sortableTable" class="col-8 table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Booking id</th>
                            <th>Rate</th>
                            <th>Comment</th>
                            <th>Customer Name</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="f" items="${listFeedback}">
                        <tr>
                            <td>${f.getBookingId()}</td>
                            <td>${f.getRatingValue()}</td>
                            <td>${f.getComment()}</td>
                            <td>${f.getUserFirstName()} ${f.getUserLastName()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>

    <jsp:include page="footer.jsp"></jsp:include>

</html>