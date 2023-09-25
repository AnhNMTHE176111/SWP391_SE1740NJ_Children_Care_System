<%-- 
    Document   : change-profile
    Created on : Sep 18, 2023, 2:29:52 PM
    Author     : dmx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/change-profile.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <button onclick="showPopup()">Show popup</button>
        <div class="popup">
            <div class="change-profile-container" style="display: none;">
                <form action="" method="post">
                    <h1>Profile Info</h1>
                    <div class="profile-image">       
                        <img src="./image/profile_user/default.jpg" alt="profile user" id="image-user">
                        <label for="profile-user-input">
                            Choose Image
                        </label>
                        <input type="file" accept="image/gif, image/jpeg, image/png" id="profile-user-input"
                               onchange="previewProfileImage(this)">
                    </div>

                    <div class="profile-field">
                        <div class="item-field first-name-field">
                            <label for="firstName">First name (*)</label>
                            <input type="text" name="firstName" id="firstName" required>
                        </div>
                        <div class="item-field last-name-field">
                            <label for="lastName">Last name (*)</label>
                            <input type="text" name="lastName" id="lastName" required>
                        </div>
                        <div class="item-field email-field">
                            <label for="email">Email (*)</label>
                            <input type="text" name="email" id="email" required>
                        </div>
                        <div class="item-field phone-field">
                            <label for="phone">Phone ( Optional )</label>
                            <input type="text" name="phone" id="phone">
                        </div>
                        <div class="item-field address-field">
                            <label for="address">Address ( Optional )</label>
                            <input type="text" name="address" id="address">
                        </div>
                        <div class="item-field dob-field">
                            <label for="dob">Date of birth (*)</label>
                            <input type="date" name="dob" id="dob" required>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="submit" id="update-btn">Update</button>
                        <button id="cancel-btn" onclick="closePopup()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="./js/changeImageProfile.js"></script>
    </body>
</html>
