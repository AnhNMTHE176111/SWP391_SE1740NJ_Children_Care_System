<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
        <!--       
                   test
                    <style>
                    .gallery-wrap .img-big-wrap img {
                        height: 450px;
                        width: auto;
                        display: inline-block;
                        cursor: zoom-in;
                    }
        
        
                    .gallery-wrap .img-small-wrap .item-gallery {
                        width: 60px;
                        height: 60px;
                        border: 1px solid #ddd;
                        margin: 7px 2px;
                        display: inline-block;
                        overflow: hidden;
                    }
        
                    .gallery-wrap .img-small-wrap {
                        text-align: center;
                    }
                    .gallery-wrap .img-small-wrap img {
                        max-width: 100%;
                        max-height: 100%;
                        object-fit: cover;
                        border-radius: 4px;
                        cursor: zoom-in;
                    }
                    .img-big-wrap img{
                        width: 100% !important;
                        height: auto !important;
                    }
                </style>-->
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bannerHome.jsp"></jsp:include>




            <div class="text-center pb-2">
                <p class="section-title px-5"><span class="px-2">Our Doctor</span></p>
            </div>

            <div class="container" style="margin-bottom: 20px">
                <div class="row">           
                    <div class="col-sm-12">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-3 border-right">


                                        <div> <a href="#"><img src="${doctorDetail.getAvatar()}"></a></div>


                                </aside>

                                <aside class="col-sm-9">
                                    <form action="cart">
                                        <article class="card-body p-5">
                                            <h3 class="title mb-3">${doctorDetail.lastname} ${doctorDetail.firstname} </h3>

                                            <!--                                            <p class="price-detail-wrap"> 
                                                                                            <span class="price h3 text-warning"> 
                                                                                                <span> $ ${detail.price} </span>
                                                                                            </span> 
                                                                                        </p> -->
                                            <dl>
                                                <!--                                                <dt>Description</dt>-->
                                                <dd><p>${doctorDetail.description} </p></dd>
                                            </dl>
                                            <hr>
                                            <div class="row">

                                                <!--                                                <div class="col-sm-5">
                                                                                                    <dl class="param param-inline">
                                                                                                        <dt>Quantity: </dt>
                                                                                                        <dd>
                                                                                                            <input type="hidden" name="pid" value="${detail.id}">
                                                                                                            <input type="number" name="quantity" class="form-control form-control-sm" value="1">
                                                                                                        </dd>
                                                                                                    </dl>  
                                                                                                </div> -->
                                            </div> 
                                            <hr>
                                        </article>   
                                    </form>

                                </aside>  
                            </div>  
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="text-center pb-2">
                <p class="section-title px-5"><span class="px-2">Related Blog</span></p>
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
