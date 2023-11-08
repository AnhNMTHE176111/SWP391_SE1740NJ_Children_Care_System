<%-- Document : home.jsp Created on : Sep 17, 2023, 9:54:48 PM Author : admin --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" />
    </head>

    <body>
        <jsp:include page="change-profile.jsp"></jsp:include>

            <!-- Navbar Start -->
            <div class="container-fluid position-relative shadow">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
                    <a href="" class="navbar-brand font-weight-bold text-secondary" style="font-size: 50px;">
                        <!--                <i class="flaticon-043-teddy-bear"></i>-->
                        <span class="text-primary">ChildCare</span>
                    </a>
                    <!--            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>-->

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav font-weight-bold mx-auto py-0">
                        <c:if test="${sessionScope.roleId eq 4}">
                            <a href="admin" class="nav-item nav-link">Admin Dashboard</a>
                        </c:if>
                        <c:if test="${sessionScope.roleId eq 3}">
                            <a href="/manage" class="nav-item nav-link " >Manage Dashboard</a>
                            <a href="/manageService" class="nav-item nav-link " >Services</a>

                        </c:if>

                        <a href="/home" class="nav-item nav-link">Home</a>

                        <a href="/blog" class="nav-item nav-link">Blogs</a>

                        <c:if test="${sessionScope.roleId ne 3}">
                            <a href="/service" class="nav-item nav-link">Services</a>
                        </c:if>

                        <a href="listDoctor" class="nav-item nav-link">Doctors</a>

                        <c:if test="${sessionScope.roleId eq 1}">
                            <a href="/my" class="nav-item nav-link " >My Reservation</a>
                        </c:if>
                        <c:if test="${sessionScope.roleId eq 2}">
                            <a href="/reservation" class="nav-item nav-link " >Reservation</a>
                            <a href="/feedbackstaff" class="nav-item nav-link " >Feedback</a>
                        </c:if>
                        <c:if test="${sessionScope.roleId ne 2 && sessionScope.roleId ne 3}">
                            <a href="booking" class="nav-item nav-link">Booking</a>
                        </c:if>
                    </div>

                    <ul class="nav">
                        <c:if test="${sessionScope.name ne null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#" onclick="showPopup()">${sessionScope.name}</a>
                            </li>
                            <li class="nav-item">
                                <img onclick="showPopup()" style="height:40px;width:40px;border-radius:50%; object-fit: cover; cursor: pointer"
                                     src=./image/profile_user/user${sessionScope.user.getUserId()}.jpg 
                                     alt="avatar"
                                     id="idImgAvatar"/>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.name eq null}">
                            <li class="nav-item">
                                <a href="login.jsp" class="btn btn-primary px-20">Login</a>
                                <a href="registerAccount.jsp" class="btn btn-primary px-20">Signup</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>
        </div>

        <script src="./js/changeImageProfile.js"></script>
    </body>

</html>
