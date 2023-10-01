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
                <div class="container-fluid position-relative shadow" style="position: fixed; top: 0;">
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
                                <a href="index.html" class="nav-item nav-link active">Home</a>
                                <a href="about.html" class="nav-item nav-link">Blogs</a>
                                <a href="/service" class="nav-item nav-link">Services</a>
                                <a href="team.html" class="nav-item nav-link">Doctors</a>
                                <div class="nav-item dropdown">
                                    <a href="/servicelist" class="nav-link dropdown-toggle"
                                        data-toggle="dropdown">Specialist</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="blog.html" class="dropdown-item">Blog Grid</a>
                                        <a href="single.html" class="dropdown-item">Blog Detail</a>
                                    </div>
                                </div>
                                <a href="booking" class="nav-item nav-link">Booking</a>
                            </div>

                            <ul class="nav">
                                <c:if test="${sessionScope.name ne null}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Hello ${sessionScope.name}</a>
                                    </li>
                                    <li class="nav-item">
                                        <image onclick="showPopup()" style="height:40px;width:40px;border-radius:50%"
                                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU">
                                        </image>
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

                <!-- Header Start -->
                <div class="container-fluid bg-primary px-0 px-md-5 mb-5">
                    <div class="row align-items-center px-3" style="padding: 15px 15px">
                        <div class="col-lg-6 text-center text-lg-left">
                            <h4 class="text-white mb-4 mt-5 mt-lg-0">Children's health care center</h4>
                            <h2 class="display-3 font-weight-bold text-white">Dedication to children's health care</h2>
                            <p class="text-white mb-4">Support and advice on health, emotions, and life – designed for
                                kids and approved by doctors.</p>
                            <a href="" class="btn btn-secondary mt-1 py-3 px-5">Learn More</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-right">
                            <img
                                src="https://www.waldenu.edu/media/5390/seo-2158-bs-african-american-pediatrician-353293868-1200x675"
                                style="width:110%" alt="">
                        </div>
                    </div>
                </div>
                <!-- Header End -->


            </body>

            </html>