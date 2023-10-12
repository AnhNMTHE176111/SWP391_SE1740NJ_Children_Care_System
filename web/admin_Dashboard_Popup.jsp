<%-- Document : adminDashboard_Popup Created on : Oct 7, 2023, 1:40:25 PM Author : dmx --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
                integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="./css/adminDashboard_Popup_style.css" />
            <title>JSP Page</title>
        </head>

        <body>
            <div class="popup" style="display: none;">
                <div class="filter-container" id="add-newuser-container" style="display: none;">
                    <form action="add-new-user" method="post">
                        <div class="filter-title">
                            <h1>Add New User</h1>
                        </div>
                        <table>
                            <tbody>
                                <tr>
                                    <td><label for="username">First Name</label></td>
                                    <td><input type="username" name="firstname" placeholder="Enter First Name..."
                                            id="username" required></td>
                                </tr>
                                <tr>
                                    <td><label for="username">Last Name</label></td>
                                    <td><input type="username" name="lastname" placeholder="Enter Last Name..."
                                            id="username" required></td>
                                </tr>
                                <tr>
                                    <td><label for="email">Email</label></td>
                                    <td><input type="email" name="email" placeholder="Enter Email..." id="email"
                                            required></td>
                                </tr>
                                <tr>
                                    <td><label for="password">Password</label></td>
                                    <td><input type="password" name="password" placeholder="Enter password..."
                                            id="password" required></td>
                                </tr>
                                <tr>
                                    <td><label for="repassword">Repeat Password</label></td>
                                    <td><input type="password" name="repassword" placeholder="Repeat Password..."
                                            id="repassword" required></td>
                                </tr>
                                <tr>
                                    <td><label for="address">Address</label></td>
                                    <td><input type="address" name="address" placeholder="Enter Address..." id="address"
                                            required></td>
                                </tr>
                                <tr>
                                    <td><label for="phone">Phone</label></td>
                                    <td><input type="phone" name="phone" placeholder="Enter phone..." id="phone"
                                            required></td>
                                </tr>
                                <tr>
                                    <td>Date Of Birth</td>
                                    <td><input type="date" name="dob" id="dobFrom"></td>
                                </tr>
                                <tr>
                                    <td>
                                        Role
                                        <select name="roleid" id="" required>
                                            <option>Choose Role</option>
                                            <option value="4">Admin</option>
                                            <option value="3">Manager</option>
                                            <option value="2">Staff</option>
                                            <option value="1">Customer</option>
                                            <option value="0">Guest</option>
                                        </select>
                                    </td>
                                    <td>
                                        Status
                                        <select name="status" id="" required>
                                            <option>Choose Status</option>
                                            <option value="1">Active</option>
                                            <option value="0">Banned</option>
                                        </select>

                                        Gender
                                        <select name="gender" id="" required>
                                            <option>Choose Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="filter-btn">
                            <button id="cancel-btn" type="reset">Cancel</button>
                            <button id="add-user-btn" type="submit">Add</button>
                        </div>
                    </form>
                </div>

                <div class="filter-container" id="filter-container" style="display: none;">
                    <form action="">
                        <div class="filter-title">
                            <h1>Filter Option</h1>
                        </div>
                        <table>
                            <tbody>
                                <tr>
                                    <td><label for="username">User Name</label></td>
                                    <td><input type="username" placeholder="Enter User Name..." id="username"></td>
                                </tr>
                                <tr>
                                    <td><label for="email">Email</label></td>
                                    <td><input type="email" placeholder="Enter Email..." id="email"></td>
                                </tr>
                                <tr>
                                    <td><label for="address">Address</label></td>
                                    <td><input type="address" placeholder="Enter Address..." id="address"></td>
                                </tr>
                                <tr>
                                    <td><label for="phone">Phone</label></td>
                                    <td><input type="phone" placeholder="Enter phone..." id="phone"></td>
                                </tr>
                                <tr>
                                    <td>Date Of Birth From</td>
                                    <td><input type="date" name="dobFrom" id="dobFrom"> To <input type="date"
                                            name="dobTo" id="dobTo"></td>
                                </tr>
                                <tr>
                                    <td>Created From</td>
                                    <td><input type="date" name="dobFrom" id="dobFrom"> To <input type="date"
                                            name="dobTo" id="dobTo"></td>
                                </tr>
                                <tr>
                                    <td>
                                        Role
                                        <select name="" id="">
                                            <option>Choose Role</option>
                                            <option value="">Admin</option>
                                            <option value="">Manager</option>
                                            <option value="">Staff</option>
                                            <option value="">Customer</option>
                                            <option value="">Guest</option>
                                        </select>
                                    </td>
                                    <td>
                                        Status
                                        <select name="" id="">
                                            <option>Choose Status</option>
                                            <option value="">Active</option>
                                            <option value="">Banned</option>
                                        </select>

                                        Gender
                                        <select name="" id="">
                                            <option>Choose Gender</option>
                                            <option value="">Male</option>
                                            <option value="">Female</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="filter-btn">
                            <button id="cancel-filter-btn" type="reset">Cancel</button>
                            <button id="filter-btn" type="submit">Filter</button>
                        </div>
                    </form>
                </div>
            </div>
            <script src="./js/filter_Popup.js"></script>
        </body>

        </html>