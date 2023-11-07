<%-- 
    Document   : blogdetail
    Created on : Oct 1, 2023, 9:08:36 PM
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

            <!-- Detail Start -->
            <div class="container py-5">
                <div class="row pt-5">
                    <div class="col-lg-8">
                        <div class="d-flex flex-column text-left mb-3">
                            <p class="section-title pr-5"><span class="pr-2">Blog Detail Page</span></p>
                            <p class="mb-3 font-title" > ${postDetail.title}</p>
                        <div class="d-flex">
                            <!--                        <p class="mr-3"><i class="fa fa-user text-primary"></i> Admin</p>
                                                    <p class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</p>
                                                    <p class="mr-3"><i class="fa fa-comments text-primary"></i> 15</p>-->
                        </div>
                    </div>
                    <div class="mb-5">
                        <img class="img-fluid rounded w-100 mb-4" src="${postDetail.getAvatar()}" alt="Image">
                        <p class="indent"> ${postDetail.content}</p>
                    </div>

                </div>

                <div class="col-lg-4 mt-5 mt-lg-0">
                    <!-- Author Bio -->

                    <div class="text-center bg-light " style="padding:10px 10px">
                        <h3 class="text-secondary mb-3">Most Viewed</h3>
                        <a href="postDetail?postId=${viewed.postId}"> <img src="${viewed.getAvatar()}" style="width: 300px;"> </a>
                        <p class="text-secondary mb-3 mt-3" style="font-size: 20px; font-weight: 600; color: #222;">${viewed.title}</p>                    
                    </div>

                    <!-- Search Form -->
<!--                    <div class="mb-5" style="padding-top: 10px">
                        <form action="">
                            <div class="input-group">
                                <input name="txt" type="text" class="form-control" placeholder="Search...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>-->
                    <!-- Single Image -->
                    <!--                    <div class="mb-5">
                                            <img src="img/blog-1.jpg" alt="" class="img-fluid rounded">
                                        </div>-->

                    <!-- Recent Post -->
                    <div class="mb-5 mt-5">
                        <h2 class="mb-4">Another Post</h2>
                        <c:forEach items="${listP}" var="o" varStatus="status">
                            <div class="d-flex align-items-center bg-light shadow-sm rounded overflow-hidden mb-3"> 
                                <a href="postDetail?postId=${o.postId}"> <img class="img-fluid" style="width: 220px; height: 80px;" src="${o.getAvatar()}"> </a>
                                <div class="pl-3">
                                    <p style="font-size: 15px; font-weight: 600; color: #222;">${o.title}</p>
                                    <div class="d-flex">
                                        <!--                                    <small class="mr-3"><i class="fa fa-user text-primary"></i> Admin</small>
                                                                            <small class="mr-3"><i class="fa fa-folder text-primary"></i> Web Design</small>
                                                                            <small class="mr-3"><i class="fa fa-comments text-primary"></i> 15</small>-->
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Single Image -->
                    <!--                    <div class="mb-5">
                                            <img src="img/blog-2.jpg" alt="" class="img-fluid rounded">
                                        </div>
                    
                    
                                         Single Image 
                                        <div class="mb-5">
                                            <img src="img/blog-3.jpg" alt="" class="img-fluid rounded">
                                        </div>-->
                </div>
            </div>
        </div>
        <!-- Detail End -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
