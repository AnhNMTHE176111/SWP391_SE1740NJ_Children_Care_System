<%-- 
    Document   : admin_Dashboard_ListUser
    Created on : Oct 7, 2023, 1:46:28 PM
    Author     : dmx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="admin_Dashboard_Popup.jsp"></jsp:include>

        <div class="dashboard-container">
            <div class="side-navbar-container">
                <h3>Admin Dashboard</h3>
                <ul>
                    <li><i class="fa-solid fa-chart-simple"></i>Analytics</li>
                    <li><i class="fa-solid fa-users"></i>User Manager</li>
                    <li><i class="fa-solid fa-gear"></i>Setting</li>
                </ul>
            </div>

            <div class="user-container" style="width: 100%;">

                <div class="user-list-container">
                    <h1 class="user-container-table">List User</h1>
                    <div class="top-option">
                        <form action="" class="search-name-form">
                            <input type="text" placeholder="Enter name of User...">
                            <button><i class="fa-solid fa-magnifying-glass"></i> Search</button>
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
        </div>
        <script src="./js/filter_Popup.js"></script>
    </body>
</html>
