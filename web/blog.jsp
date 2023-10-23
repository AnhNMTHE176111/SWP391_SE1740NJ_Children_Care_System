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

        <form action="searchPost" method="post" class="form-inline" style="margin-left: 1000px">
                <div class="input-group">
                    <input name="txt" type="text" class="form-control" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>

            <!-- Blog Start -->
            <div class="container">
                <div class="text-center pb-2">
                    <p class="section-title px-5"><span class="px-2">Our Blog</span></p>
                    <h1 class="mb-4">Featured Titles</h1>
                </div>
                <div class="row">
                <c:forEach items="${listP}" var="o" varStatus="status">
                    <div class="col-lg-4 col-md-6 col-sm-12"> 
                        <div class="card border-0 shadow-sm mb-2">
                            <a href="postDetail?postId=${o.postId}"> <img class="card-img-top mb-2" src="${o.getAvatar()}" alt=""> </a>
                            <div class="card-body bg-light text-center p-4">
                                <p style="font-size: 20px; font-weight: 600; color: #222;">${o.title}</p>
                                <div class="d-flex justify-content-center mb-3">
                                    <!--                                <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                        <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                        <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>-->
                                </div>
                                <p>${listIntro[status.index]}</p>
                                <a href="postDetail?postId=${o.postId}" class="btn btn-primary px-4 mx-auto my-2">Read More</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
