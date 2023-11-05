<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/staffeedback.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="dashboard-container">
            <div class="user-container" style="width: 100%;">

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
                    <table>
                        <thead>
                            <tr>
                                <td>User</td>
                                <td>Gender</td>
                                <td>Role</td>
                                <td>Date of Birth</td>
                                <td>Created</td>
                                <td>Status</td>
                                <td>Email</td>
                                <td>Address</td>
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
                                    <td>${user.getGender()}</td>
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
                                    <td>${user.getAddress()}</td>
                                    <td>
                                        <button id="editUser" onclick='editUser()' ><i class="fa-solid fa-user-pen"></i> Edit</button>
                                        <button id="deleteUser" onclick="deleteUser()" ><i class="fa-solid fa-trash"></i> Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>