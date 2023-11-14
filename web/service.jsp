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
        <style>
            /* Styling for the table */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;

            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                justify-content: center;
                text-align: center;
            }

            th {
                background-color: #f2f2f2;
            }

            /* Styling for buttons */
            button, input[type="submit"] {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 5px;
                cursor: pointer;
            }

            /* Additional styles for delete button */
            input[type="submit"][name="delete"] {
                background-color: #FF0000;
            }

            /* Container styles */
            .container {
                max-width: 800px;
                margin: 0 auto;
            }

            /* Add margin to the div containing the "Add new service" button */
            .add-button {
                margin: 20px;
                display: flex;
                gap: 10px;
            }

        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>  
            <div class="page-banner">
                <img src="image/service/systemCare.jpg" class="w-100">
            </div>
        <c:choose>
            <c:when test="${sessionScope.roleId == 2}">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="section-title text-center mb-4 pb-2">
                                <h4 class="title mb-4" style="margin-top: 20px; border: none;">Services of doctor: ${sessionScope.user.getLastName()} ${sessionScope.user.getFirstName()}</h4>
                                <p class="text-muted para-desc mx-auto mb-0">Cuộc sống hiện đại bận rộn, áp lực công việc, những biến đổi trong đời sống cá nhân đang là nguyên nhân hàng đầu 
                                    dẫn đến sự gia tăng bệnh về tâm lý và tâm thần. Để vượt qua các thương tâm lý và trở lại được cuộc số
                                    ng sinh hoạt bình thường, khách hàng cần được thăm khám và điều trị một cách bài bản. Chính vì thế, 
                                    Bệnh viện Đa khoa Hồng Ngọc đã thành lập Khoa Tâm lý và Sức khỏe tâm thần nhằm giúp những ai đang gặp
                                    những vấn đề tâm lý có thể nhanh chóng cởi bỏ được áp lực để quay lại cuộc sống thường ngày..</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="margin: 50px;">
                    <c:forEach var="item" items="${service}">
                        <c:if test="${sessionScope.docId eq item.doctorId}">
                            <div class="col-lg-4 col-md-6 col-12 mt-4 pt-2">
                                <div class="card service-wrapper rounded border-0 shadow p-4">
                                    <div class="icon text-center text-custom h1 shadow rounded bg-white">
                                        <span class="uim-svg" style=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="1em"><rect width="20" height="15" x="2" y="3" class="uim-tertiary" rx="3"></rect><path class="uim-primary" d="M16,21H8a.99992.99992,0,0,1-.832-1.55469l4-6a1.03785,1.03785,0,0,1,1.66406,0l4,6A.99992.99992,0,0,1,16,21Z"></path></svg></span>
                                    </div>
                                    <div class="content mt-4">
                                        <h5 class="title">${item.getServiceName()}</h5>
                                        <p class="text-muted mt-3 mb-0">Với các trang thiết bị hiện đại, khoa có khả năng triển khai các trắc nghiệm tâm lý, liệu pháp tâm lý chuyên sâu phục vụ khám chữa bệnh.</p>
                                        <div class="mt-3">
                                            <a href="servicelist?id=${item.getServiceId()}" class="text-custom">Read More <i class="mdi mdi-chevron-right"></i></a>
                                        </div>
                                    </div>
                                    <div class="big-icon h1 text-custom">
                                        <span class="uim-svg" style=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="1em"><rect width="20" height="15" x="2" y="3" class="uim-tertiary" rx="3"></rect><path class="uim-primary" d="M16,21H8a.99992.99992,0,0,1-.832-1.55469l4-6a1.03785,1.03785,0,0,1,1.66406,0l4,6A.99992.99992,0,0,1,16,21Z"></path></svg></span>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:when>

            <c:when test="${sessionScope.roleId eq  3}">

                <div class="add-button">
                    <form action="manageAddService">
                        <button>Add new service</button>  
                    </form>
                    <button class="btn btn-outline-dark">
                        <a href="\manage">Back</a>
                    </button>
                </div>
                <table border="1"  >
                    <thead>
                        <tr>
                            <th style="text-align: center">ID</th>
                            <th style="text-align: center">Service Name</th>
                            <th style="text-align: center">Price</th>
                            <th style="text-align: center">Doctor Name</th>
                            <th style="text-align: center">Description</th>
                            <th style="text-align: center">Action</th>
                            <th style="text-align: center">Action</th>
                        </tr>
                    </thead>
                    <tbody>                  
                        <c:forEach var="list" items="${list}" varStatus="loop">
                            <c:set var="count" value="${loop.index + 1}" />
                            <tr>
                                <td>${count}</td>
                                <td>${list.getServiceName()}</td>
                                <td>${list.getPrice()}</td>
                                <td>${list.getDoctorName()} </td>
                                <td>${list.getDescription()} </td>
                        <form action="manageService" method="post">
                            <input type="hidden" name="serviceId" value="${list.getServiceId()}" >
                            <input type="hidden" name="docId" value="${list.getDoctorId()}"  >

                            <td><input type="submit" value="delete" name="delete" onclick="deleteUser(${list.getServiceId()}, `${list.getDoctorName()} ${list.getServiceName()}`)" >  </td>
                            <td><input type="submit" value="change" name="change"></td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center mt-3 mt-sm-3">
            <ul class="pagination justify-content-center mb-0">
                <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                    <a class="page-link" href="manageService?page=${currentPage - 1}">Prev</a>
                </li>
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <li class="page-item <c:if test="${currentPage == page}">active</c:if>">
                        <a class="page-link" href="manageService?page=${page}">${page}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                    <a class="page-link" href="manageService?page=${currentPage + 1}">Next</a>
                </li>
            </ul>
        </div>

    </c:when>

    <c:otherwise>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="section-title text-center mb-4 pb-2">
                        <h4 class="title mb-4" style="margin-top: 20px; border: none;">Our Services</h4>
                        <p class="text-muted para-desc mx-auto mb-0">${mess}</p>
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
                                <p class="text-muted mt-3 mb-0">Với các trang thiết bị hiện đại, khoa có khả năng triển khai các trắc nghiệm tâm lý, liệu pháp tâm lý chuyên sâu phục vụ khám chữa bệnh.</p>
                                <div class="mt-3">
                                    <a href="servicelist?id=${item.getServiceId()}" class="text-custom">Read More <i class="mdi mdi-chevron-right"></i></a>
                                </div>
                            </div>
                            <div class="big-icon h1 text-custom">
                                <span class="uim-svg" style=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="1em"><rect width="20" height="15" x="2" y="3" class="uim-tertiary" rx="3"></rect><path class="uim-primary" d="M16,21H8a.99992.99992,0,0,1-.832-1.55469l4-6a1.03785,1.03785,0,0,1,1.66406,0l4,6A.99992.99992,0,0,1,16,21Z"></path></svg></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="text-center mt-3 mt-sm-3">
            <ul class="pagination justify-content-center mb-0">
                <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                    <a class="page-link" href="service?page=${currentPage - 1}">Prev</a>
                </li>
                <c:forEach begin="1" end="${totalPages}" var="page">
                    <li class="page-item <c:if test="${currentPage == page}">active</c:if>">
                        <a class="page-link" href="service?page=${page}">${page}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                    <a class="page-link" href="service?page=${currentPage + 1}">Next</a>
                </li>
            </ul>
        </div>
    </c:otherwise>

</c:choose>

<script>
    function editUser(id) {
        window.location.href = `/user-profile?userId=` + id;
    }
    function deleteUser(id, name) {
        if (confirm(`Delete user ` + id + ` with name ` + name)) {
            window.location.href = `/delete-user?userId=` + id;
        }
    }
</script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>













