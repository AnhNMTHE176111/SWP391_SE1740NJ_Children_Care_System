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
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="admin_Dashboard_Popup.jsp"></jsp:include>
        
        <div class="user-container" style="width: 100%; margin-left: 15%">

            <div class="user-list-container">
                <h1 class="user-container-table"> User Manager</h1>
                <div class="top-option">
                    <form action="admin-manage-user" class="search-name-form" method="post">
                        <input type="text" name="username" placeholder="Enter name of User...">
                        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
                        <button id="btn-show-filter"><i class="fa-solid fa-filter"></i> Filter</button>
                    </form>
                    <button id="addNewUser"><i class="fa-solid fa-user-plus"></i> Add New User</button>
                </div>
                <table>
                    <thead>
                        <tr>
                            <td>User</td>
                            <td>Role</td>
                            <td>Date of Birth</td>
                            <td>Created</td>
                            <td>Status</td>
                            <td>Email</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listUser}" var="user">
                        <tr>
                            <td>
                                <div class="name">
                                    ${user.getLastName()} ${user.getFirstName()} 
                                </div>
                            </td>
                            <td>
                                <p>${user.getRoleId() == 0 ? 'Admin' : ''}</p>
                                <p>${user.getRoleId() == 1 ? 'Customer' : ''}</p>
                                <p>${user.getRoleId() == 2 ? 'Staff' : ''}</p>
                                <p>${user.getRoleId() == 3 ? 'Manager' : ''}</p>
                                <p>${user.getRoleId() == 4 ? 'Admin' : ''}</p>
                            </td>
                            <td>${user.getDob()}</td>
                            <td>${user.getCreatedAt()}</td>
                            <td class="active">${user.getStatus() == 1 ? 'Active' : 'Banner'}</td>
                            <td>${user.getEmail()}</td>
                            <td>
                                <button id="editUser"><i class="fa-solid fa-user-pen"></i> Edit</button>
                                <button id="deleteUser"><i class="fa-solid fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td>
                                <div class="name">
                                    Mila Kunis
                                </div>
                            </td>
                            <td>
                                <p>Admin</p>
                            </td>
                            <td>2002/02/03</td>
                            <td>2023/10/01</td>
                            <td class="active">Active</td>
                            <td>abcxyz@gmail.com</td>
                            <td>
                                <button id="editUser"><i class="fa-solid fa-user-pen"></i> Edit</button>
                                <button id="deleteUser"><i class="fa-solid fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="name">
                                    Mila Kunis
                                </div>
                            </td>
                            <td>
                                <p>Manager</p>
                            </td>
                            <td>2002/02/03</td>
                            <td>2023/10/01</td>
                            <td class="banned">Banned</td>
                            <td>abcxyz@gmail.com</td>
                            <td>
                                <button id="editUser"><i class="fa-solid fa-user-pen"></i> Edit</button>
                                <button id="deleteUser"><i class="fa-solid fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="name">
                                    Mila Kunis
                                </div>
                            </td>
                            <td>
                                <p>Admin</p>
                            </td>
                            <td>2002/02/03</td>
                            <td>2023/10/01</td>
                            <td class="active">Active</td>
                            <td>abcxyz@gmail.com</td>
                            <td>
                                <button id="editUser"><i class="fa-solid fa-user-pen"></i> Edit</button>
                                <button id="deleteUser"><i class="fa-solid fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="name">
                                    Mila Kunis
                                </div>
                            </td>
                            <td>
                                <p>Admin</p>
                            </td>
                            <td>2002/02/03</td>
                            <td>2023/10/01</td>
                            <td class="active">Active</td>
                            <td>abcxyz@gmail.com</td>
                            <td>
                                <button id="editUser"><i class="fa-solid fa-user-pen"></i> Edit</button>
                                <button id="deleteUser"><i class="fa-solid fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        <script src="./js/filter_Popup.js"></script>
    </body>
</html>
