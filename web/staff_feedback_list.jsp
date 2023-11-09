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


            #status option {
                padding: 10px;
            }


            #status option:hover {
                background-color: #f0f0f0;
            }

            .feedbackcontainer{
                margin-right: 320px;
            }

            .button-4 {
                appearance: none;
                background-color: #FAFBFC;
                border: 1px solid rgba(27, 31, 35, 0.15);
                border-radius: 6px;
                box-shadow: rgba(27, 31, 35, 0.04) 0 1px 0, rgba(255, 255, 255, 0.25) 0 1px 0 inset;
                box-sizing: border-box;
                color: #24292E;
                cursor: pointer;
                display: inline-block;
                font-family: -apple-system, system-ui, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
                font-size: 14px;
                font-weight: 500;
                line-height: 20px;
                list-style: none;
                padding: 6px 16px;
                position: relative;
                transition: background-color 0.2s cubic-bezier(0.3, 0, 0.5, 1);
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                vertical-align: middle;
                white-space: nowrap;
                word-wrap: break-word;
            }

            .button-4:hover {
                background-color: #F3F4F6;
                text-decoration: none;
                transition-duration: 0.1s;
            }

            .button-4:disabled {
                background-color: #FAFBFC;
                border-color: rgba(27, 31, 35, 0.15);
                color: #959DA5;
                cursor: default;
            }

            .button-4:active {
                background-color: #EDEFF2;
                box-shadow: rgba(225, 228, 232, 0.2) 0 1px 0 inset;
                transition: none 0s;
            }

            .button-4:focus {
                outline: 1px transparent;
            }

            .button-4:before {
                display: none;
            }

            .button-4:-webkit-details-marker {
                display: none;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>

            <h1 style="margin-left: 100px;padding: 40px;">List Reservation </h1>
            <div class="col-12 d-flex justify-content-end feedbackcontainer" style="margin-bottom: 10px">
                <form class="feedbackcontainer" action="feedbackstaff" method="GET">
                    <select id="rate" class="feedbackrate" name="rate" style="width: 100px; height: 32px; border-radius: 6px;">
                        <option value= "">All</option>
                        <option value="Excellent">Excellent</option>
                        <option value="Average">Average</option>
                        <option value="Good">Good</option>
                        <option value="Poor">Poor</option>
                    </select>
                    <button type="submit" class="button-4" role="button" style="margin-right: -40px">Filter</button>
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
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="f" items="${listFeedback}">
                        <c:choose>
                            <c:when test="${f.getRatingValue() eq 'Excellent'}">
                                <tr>
                                    <td>${f.getBookingId()}</td>
                                    <td style="color: green;">${f.getRatingValue()}</td>
                                    <td>${f.getComment()}</td>
                                    <td>${f.getUserFirstName()} ${f.getUserLastName()}</td>
                                </tr>
                            </c:when>
                            <c:when test="${f.getRatingValue() eq 'Good'}">
                                <tr>
                                    <td>${f.getBookingId()}</td>
                                    <td style="color: gold;">${f.getRatingValue()}</td>
                                    <td>${f.getComment()}</td>
                                    <td>${f.getUserFirstName()} ${f.getUserLastName()}</td>
                                </tr>
                            </c:when>
                            <c:when test="${f.getRatingValue() eq 'Average'}">
                                <tr>
                                    <td>${f.getBookingId()}</td>
                                    <td style="color: orange;">${f.getRatingValue()}</td>
                                    <td>${f.getComment()}</td>
                                    <td>${f.getUserFirstName()} ${f.getUserLastName()}</td>
                                </tr>
                            </c:when>
                            <c:when test="${f.getRatingValue() eq 'Poor'}">
                                <tr>
                                    <td>${f.getBookingId()}</td>
                                    <td style="color: red;">${f.getRatingValue()}</td>
                                    <td>${f.getComment()}</td>
                                    <td>${f.getUserFirstName()} ${f.getUserLastName()}</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>N/A</td>
                                    <td>N/A</td>
                                    <td>N/A</td>
                                    <td>N/A</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>

    <jsp:include page="footer.jsp"></jsp:include>

</html>