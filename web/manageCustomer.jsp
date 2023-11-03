<%-- 
    Document   : manageCustomer.jsp
    Created on : Oct 28, 2023, 8:49:47 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="jakarta.servlet.http.HttpServlet" %>
<html lang="en">

    <head>
        <meta charset="utf-8">


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                background-color: #f8f9fa !important
            }

            .p-4 {
                padding: 1.5rem !important;
            }

            .mb-0,
            .my-0 {
                margin-bottom: 0 !important;
            }

            .shadow-sm {
                box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;
            }

            /* user-dashboard-info-box */
            .user-dashboard-info-box .candidates-list .thumb {
                margin-right: 20px;
            }

            .user-dashboard-info-box .candidates-list .thumb img {
                width: 80px;
                height: 80px;
                -o-object-fit: cover;
                object-fit: cover;
                overflow: hidden;
                border-radius: 50%;
            }

            .user-dashboard-info-box .title {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                padding: 30px 0;
            }

            .user-dashboard-info-box .candidates-list td {
                vertical-align: middle;
            }

            .user-dashboard-info-box td li {
                margin: 0 4px;
            }

            .user-dashboard-info-box .table thead th {
                border-bottom: none;
            }

            .table.manage-candidates-top th {
                border: 0;
            }

            .user-dashboard-info-box .candidate-list-favourite-time .candidate-list-favourite {
                margin-bottom: 10px;
            }

            .table.manage-candidates-top {
                min-width: 650px;
            }

            .user-dashboard-info-box .candidate-list-details ul {
                color: #969696;
            }

            /* Candidate List */
            .candidate-list {
                background: #ffffff;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                border-bottom: 1px solid #eeeeee;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                padding: 20px;
                -webkit-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }

            .candidate-list:hover {
                -webkit-box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
                box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
                position: relative;
                z-index: 99;
            }

            .candidate-list:hover a.candidate-list-favourite {
                color: #e74c3c;
                -webkit-box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
                box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
            }

            .candidate-list .candidate-list-image {
                margin-right: 25px;
                -webkit-box-flex: 0;
                -ms-flex: 0 0 80px;
                flex: 0 0 80px;
                border: none;
            }

            .candidate-list .candidate-list-image img {
                width: 80px;
                height: 80px;
                -o-object-fit: cover;
                object-fit: cover;
            }

            .candidate-list-title {
                margin-bottom: 5px;
            }

            .candidate-list-details ul {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin-bottom: 0px;
            }

            .candidate-list-details ul li {
                margin: 5px 10px 5px 0px;
                font-size: 13px;
            }

            .candidate-list .candidate-list-favourite-time {
                margin-left: auto;
                text-align: center;
                font-size: 13px;
                -webkit-box-flex: 0;
                -ms-flex: 0 0 90px;
                flex: 0 0 90px;
            }

            .candidate-list .candidate-list-favourite-time span {
                display: block;
                margin: 0 auto;
            }

            .candidate-list .candidate-list-favourite-time .candidate-list-favourite {
                display: inline-block;
                position: relative;
                height: 40px;
                width: 40px;
                line-height: 40px;
                border: 1px solid #eeeeee;
                border-radius: 100%;
                text-align: center;
                -webkit-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
                margin-bottom: 20px;
                font-size: 16px;
                color: #646f79;
            }

            .candidate-list .candidate-list-favourite-time .candidate-list-favourite:hover {
                background: #ffffff;
                color: #e74c3c;
            }

            .candidate-banner .candidate-list:hover {
                position: inherit;
                -webkit-box-shadow: inherit;
                box-shadow: inherit;
                z-index: inherit;
            }

            .bg-white {
                background-color: #ffffff !important;
            }

            .p-4 {
                padding: 1.5rem !important;
            }

            .mb-0,
            .my-0 {
                margin-bottom: 0 !important;
            }

            .shadow-sm {
                box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;
            }

            .user-dashboard-info-box .candidates-list .thumb {
                margin-right: 20px;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
                  integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
            <div class="container mt-3 mb-4">
                <div class="col-lg-9 mt-4 mt-lg-0">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="addCustomer" method="get">
                                <button type="submit" class="btn btn-primary" ">Add New Customer</button>
                            </form>
                        </div>
                        <div class="col-md-12">
                            <div class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
                                <table class="table manage-candidates-top mb-0">
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th class="text-center">Status</th>
                                            <th class="action text-right">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="customerList" items="${customerList}" >
                                        <tr class="candidates-list">
                                            <td class="title">
                                                <div class="thumb">
                                                    <img class="img-fluid"
                                                         src="https://bootdey.com/img/Content/avatar/avatar7.png" alt>
                                                </div>
                                                <div class="candidate-list-details">
                                                    <div class="candidate-list-info">
                                                        <div class="candidate-list-title">
                                                            <h5 class="mb-0"><a href="manageCustomerDetails?id=${customerList.getUserId()}&id2=edit">${customerList.getFirstName()} ${customerList.getLastName()}</a></h5>
                                                        </div>
                                                        <div class="candidate-list-option">
                                                            <ul class="list-unstyled">
                                                                <li><i class="fas fa-venus-mars"></i></i>  ${customerList.getGender()}</li>
                                                                <li><i class="fas fa-map-marker-alt pr-1"></i>  ${customerList.getAddress()}</li>
                                                            </ul>
                                                            <ul class="list-unstyled">
                                                                <li><i class="fas fa-solid fa-phone"></i></i>  ${customerList.getPhone()}</li>
                                                                <li><i class="fas fa-solid fa-envelope"></i></i>  ${customerList.getEmail()}</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="candidate-list-favourite-time text-center">
                                                <c:choose>
                                                    <c:when test="${customerList.getStatus() eq '1'}">
                                                        <a>Active</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a>Inactive</a>
                                                    </c:otherwise>    
                                                </c:choose>
                                            </td>
                                            <td>
                                                <ul class="list-unstyled mb-0 d-flex justify-content-end">
                                                    <li><a href="manageCustomerDetails?id=${customerList.getUserId()}&id2=edit" class="text-primary" data-toggle="tooltip" titledata-original-title="view"><i class="far fa-eye"></i></a></li>
                                                    <li><a href="manageCustomerDetails?id=${customerList.getUserId()}&id2=delete" class="text-danger" data-toggle="tooltip" titledata-original-title="Delete"><i class="far fa-trash-alt"></i></a></li>
                                                </ul>
                                            </td>
                                        </c:forEach>
                                    </tr>


                                </tbody>
                            </table>
                            <div class="text-center mt-3 mt-sm-3">
                                <ul class="pagination justify-content-center mb-0">
                                    <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                                        <a class="page-link" href="manageCustomer?page=${currentPage - 1}">Prev</a>
                                    </li>
                                    <c:forEach begin="1" end="${totalPages}" var="page">
                                        <li class="page-item <c:if test="${currentPage == page}">active</c:if>">
                                            <a class="page-link" href="manageCustomer?page=${page}">${page}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                                        <a class="page-link" href="manageCustomer?page=${currentPage + 1}">Next</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>

</html>

