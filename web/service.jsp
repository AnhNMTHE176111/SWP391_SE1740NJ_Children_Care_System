<%-- 
    Document   : service
    Created on : Sep 22, 2023, 6:33:31 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>services</title>
        <link href="css/service.css" rel="stylesheet" />
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>  
            <div class="page-banner">
                <img src="image/service/systemCare.jpg" class="w-100">
            </div>

            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center mb-4 pb-2">
                            <h4 class="title mb-4" style="margin-top: 20px; border: none;">Our Services</h4>
                            <p class="text-muted para-desc mx-auto mb-0">${mess}.</p>
                        </div>
                    </div>
                    <form action="service" method="post" class="filter">
                        <div class="filter-row">
                            <h4 >Selected by</h4>
                            <select id="sort" name="id" >
                                <option value="all">All</option>
                                <option id="doctor" value="doctor">Doctor</option>
                                <option id="specialty" value="specialty">Specialty</option>
                            </select>    
                            <input class="input-submit"type="submit" value="Enter">
                        </div>
                    </form>
                </div>


            <div class="row">
                <c:forEach var="item" items="${service}">
                    <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                        <div class="card service-wrapper rounded border-0 shadow p-4">
                            <div class="icon text-center text-custom h1 shadow rounded bg-white">
                                <span class="uim-svg" style=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="1em"><rect width="20" height="15" x="2" y="3" class="uim-tertiary" rx="3"></rect><path class="uim-primary" d="M16,21H8a.99992.99992,0,0,1-.832-1.55469l4-6a1.03785,1.03785,0,0,1,1.66406,0l4,6A.99992.99992,0,0,1,16,21Z"></path></svg></span>
                            </div>
                            <div class="content mt-4">
                                <h5 class="title">${item.getServiceName()}</h5>
                                <p class="text-muted mt-3 mb-0">It is a long established fact that a reader will be distracted by the when looking at its layout.</p>
                                <div class="mt-3">
                                    <a href="servicelist?id=${item.getServiceId()}" class="text-custom">Read More <i class="mdi mdi-chevron-right"></i></a>
                                </div>
                            </div>
                            <div class="big-icon h1 text-custom">
                                <span class="uim-svg" style=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="1em"><rect width="20" height="15" x="2" y="3" class="uim-tertiary" rx="3"></rect><path class="uim-primary" d="M16,21H8a.99992.99992,0,0,1-.832-1.55469l4-6a1.03785,1.03785,0,0,1,1.66406,0l4,6A.99992.99992,0,0,1,16,21Z"></path></svg></span>
                            </div>
                        </div>
                    </div><!--end col-->
                </c:forEach>
            </div>

        </div>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>













