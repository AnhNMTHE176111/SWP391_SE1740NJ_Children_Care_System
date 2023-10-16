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
            <div class="filter-container" id="filter-container" style="display: none;">
                <form action="filter-user" method="post">
                    <div class="filter-title">
                        <h1>Filter Option</h1>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><input type="text" name="addressFilter" placeholder="Enter Address..." id="address"></td>
                            </tr>
                            <tr>
                                <td><label for="phone">Phone</label></td>
                                <td><input type="text" name="phoneFilter" placeholder="Enter phone..." id="phone"></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth From</td>
                                <td><input type="date" name="dobFromFilter" id="dobFrom"> To <input type="date"
                                                                                                    name="dobToFilter" id="dobTo"></td>
                            </tr>
                            <tr>
                                <td>Created From</td>
                                <td><input type="date" name="createdFromFilter" id="dobFrom"> To <input type="date"
                                                                                                        name="createdToFilter" id="dobTo"></td>
                            </tr>
                            <tr>
                                <td>
                                    Role
                                    <select name="roleidFilter" id="">
                                        <option value="">Choose Role</option>
                                        <option value="4">Admin</option>
                                        <option value="3">Manager</option>
                                        <option value="2">Staff</option>
                                        <option value="1">Customer</option>
                                        <option value="0">Guest</option>
                                    </select>
                                </td>
                                <td>
                                    Status
                                    <select name="statusFilter" id="">
                                        <option value="">Choose Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Banned</option>
                                    </select>

                                    Gender
                                    <select name="genderFilter" id="">
                                        <option value="">Choose Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
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