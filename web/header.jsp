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
                    <a href="contact.html" class="nav-item nav-link">Booking</a>
                </div>
                <a href="login.jsp" class="btn btn-primary px-20">Login</a>
                <a href="" class="btn btn-primary px-20">Signup</a>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->
    </body>
</html>
