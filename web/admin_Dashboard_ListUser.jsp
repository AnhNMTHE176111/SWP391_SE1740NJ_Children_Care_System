<%-- 
    Document   : admin_Dashboard_ListUser
    Created on : Oct 7, 2023, 1:46:28 PM
    Author     : dmx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="admin_Dashboard_Popup.jsp"></jsp:include>

        <c:if test="${sessionScope.roleId ne '4'}">
            <jsp:forward page="403.jsp"/>
        </c:if>
        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Admin Dashboard</h3>
                <ul>
                    <li onclick="changeLocation('/home')"> <i class="fa-solid fa-house"></i> Home</a></li>
                    <li onclick="changeLocation('/admin')"> <i class="fa-solid fa-chart-simple"></i> Analytics</a></li>
                    <li onclick="changeLocation('/admin-manage-user')"> <i class="fa-solid fa-users"></i> User Manager</a></li>
                    <li onclick="changeLocation('/admin-manage-setting')"> <i class="fa-solid fa-gear"></i> Setting</a></li>
                </ul>
            </div> 
            <div class="user-container" style="width: 100%; margin-left: 15%">

                <div class="user-list-container">
                    <h1 class="user-container-table"> User Manager</h1>
                    <div class="top-option">
                        <form action="admin-manage-user" class="search-name-form" method="post">
                            <input type="text" name="username" placeholder="Enter name of User...">
                            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
                            <button id="btn-show-filter"><i class="fa-solid fa-filter"></i> Filter</button>
                        </form>
                        <button id="addNewUser" onclick="changeLocation('/add-new-user')"><i class="fa-solid fa-user-plus"></i> Add New User</button>
                    </div>
                    <div class="col-12 d-flex justify-content-center">
                        <div class="col-11">
                            <table class="table table-bordered table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>User</th>
                                        <th>Gender</th>
                                        <th>Role</th>
                                        <th>Date of Birth</th>
                                        <th>Created</th>
                                        <th>Status</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="table-striped">
                                    <c:forEach items="${listUser}" var="user">
                                        <tr>
                                            <td>
                                                <div class="name">
                                                    ${user.getLastName()} ${user.getFirstName()} 
                                                </div>
                                            </td>
                                            <td>${user.getGender()}</td>
                                            <td>
                                                ${user.getRoleId() == 0 ? 'Admin' : ''}
                                                ${user.getRoleId() == 1 ? 'Customer' : ''}
                                                ${user.getRoleId() == 2 ? 'Staff' : ''}
                                                ${user.getRoleId() == 3 ? 'Manager' : ''}
                                                ${user.getRoleId() == 4 ? 'Admin' : ''}
                                            </td>
                                            <td>${user.getDob()}</td>
                                            <td>${user.getCreatedAt()}</td>
                                            <td class="active">${user.getStatus() == 1 ? 'Active' : 'Banner'}</td>
                                            <td>${user.getEmail()}</td>
                                            <td>${user.getAddress()}</td>
                                            <td>
                                                <button class="btn btn-primary" id="editUser" onclick='editUser(${user.getUserId()})' ><i class="fa-solid fa-user-pen"></i> Edit</button>
                                                <button class="btn btn-danger" id="deleteUser" onclick="deleteUser(${user.getUserId()}, `${user.getLastName()} ${user.getFirstName()}`)" ><i class="fa-solid fa-trash"></i> Delete</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-12 row d-flex justify-content-center">
                                <ul class="pagination justify-content-center mb-0">
                                    <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
                                        <a class="page-link" href="${currentLinkPage}?page=${currentPage - 1}">Prev</a>
                                    </li>
                                    <c:forEach begin="1" end="${totalPages}" var="page">
                                        <li class="page-item <c:if test="${currentPage == page}">active</c:if>">
                                            <a class="page-link" href="${currentLinkPage}?page=${page}">${page}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${currentPage == totalPages}">disabled</c:if>">
                                        <a class="page-link" href="${currentLinkPage}?page=${currentPage + 1}">Next</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="./js/filter_Popup.js"></script>
        <script>
                                                    function changeLocation(url) {
                                                        window.location.href = url;
                                                    }
        </script>
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
</html>
