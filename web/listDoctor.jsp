<%-- 
    Document   : blog
    Created on : Oct 1, 2023, 7:28:58 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
    </head>
    <body>      
        <jsp:include page="header.jsp"></jsp:include>
        
        <jsp:include page="bannerHome.jsp"></jsp:include>
        

<!--        <form action="searchPost" method="post" class="form-inline" style="margin-left: 1000px">
                <div class="input-group">
                    <input name="txt" type="text" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>-->

            <!-- Blog Start -->
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Our Doctor</span></p>
                    <h1 class="mb-4">Feature Doctors</h1>
                </div>
                <div class="row">
                <c:forEach items="${listD}" var="o" varStatus="status">
                    <div class="col-lg-4 col-md-6 col-sm-12"> 
                        <div class="card border-0 shadow-sm mb-2">
                            <a href=""> <img class="card-img-top mb-2 mt-5" style="width:100%; height:350px;" src="${o.getAvatar()}" alt=""> </a>
                            <div class="card-body bg-light text-center p-4">
                                <p style="font-size: 20px; font-weight: 600; color: #222;">${o.lastname} ${o.firstname}</p>
                                <div class="d-flex justify-content-center mb-3">
                                </div>
                                <a href="" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
