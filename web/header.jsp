<%-- 
    Document   : home.jsp
    Created on : Sep 17, 2023, 9:54:48 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
    </head>
    <body>
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
                    <a href="index.html" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">Blogs</a>
                    <a href="class.html" class="nav-item nav-link">Services</a>
                    <a href="team.html" class="nav-item nav-link">Doctors</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Specialist</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="blog.html" class="dropdown-item">Blog Grid</a>
                                <a href="single.html" class="dropdown-item">Blog Detail</a>
                            </div>
                        </div>
                    <a href="Booking.jsp" class="nav-item nav-link">Booking</a>
                </div>
                
                <c:if test="${sessionScope.name != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.name}</a>
                    </li>
                    <image style="height:40px;width:40px;border-radius:50%"  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU"></image>
                </c:if>

                <c:if test="${sessionScope.name != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>

                <c:if test="${sessionScope.name == null}">
                    <li class="nav-item">
                        <a href="login.jsp" class="btn btn-primary px-20">Login</a>
                        <a href="registerAccount.jsp" class="btn btn-primary px-20">Signup</a>
                    </li>
                </c:if>
                    
            </div>
        </nav>
    </div>
                    
    <!-- Header Start -->
        <div class="container-fluid bg-primary px-0 px-md-5 mb-5">
            <div class="row align-items-center px-3">
                <div class="col-lg-6 text-center text-lg-left">
                    <h4 class="text-white mb-4 mt-5 mt-lg-0">Children's health care center</h4>
                    <h2 class="display-3 font-weight-bold text-white">Dedication to children's health care</h2>
                    <p class="text-white mb-4">Support and advice on health, emotions, and life – designed for kids and approved by doctors.</p>
                    <a href="" class="btn btn-secondary mt-1 py-3 px-5">Learn More</a>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <img class="img-fluid mt-5" src="data:image/jpeg;base64,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" style="width: 150%" alt="">
                </div>
            </div>
        </div>
        <!-- Header End -->
               

    </body>
</html>
