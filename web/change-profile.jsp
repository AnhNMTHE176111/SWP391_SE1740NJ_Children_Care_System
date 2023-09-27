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
        <div class="popup" style="display: none;">
            <div class="change-profile-container">
                <form action="changeProfile" method="post" >
                    <h1>Profile Info</h1>
                    <div class="profile-image">       
                        <img src="./image/profile_user/default.jpg" alt="profile user" id="image-user">
                        <label for="profile-user-input">
                            Choose Image
                        </label>
                        <input type="file" accept="image/gif, image/jpeg, image/png" 
                               id="profile-user-input"  

                               name="imageFile"
                               onchange="previewProfileImage(this)" >
                    </div>

                    <div class="profile-field">
                        <div class="item-field first-name-field">
                            <label for="firstName">First name (*)</label>
                            <input type="text" name="firstName" id="firstName" value="${sessionScope.user.getFirstName()}" required>
                        </div>
                        <div class="item-field last-name-field">
                            <label for="lastName">Last name (*)</label>
                            <input type="text" name="lastName" id="lastName" value="${sessionScope.user.getLastName()}" required>
                        </div>
                        <div class="item-field email-field">
                            <label for="email">Email (View Only)</label>
                            <input type="text" name="email" id="email" value="${sessionScope.user.getEmail()}" required readonly>
                        </div>
                        <div class="item-field email-field" style="display: none">
                            <label for="oldEmail">Email (*)</label>
                            <input type="text" name="oldEmail" id="oldEmail" value="${sessionScope.user.getEmail()}" required>
                        </div>
                        <div class="item-field phone-field">
                            <label for="phone">Phone</label>
                            <input type="text" name="phone" id="phone" value="${sessionScope.user.getPhone()}" required>
                        </div>
                        <div class="item-field address-field">
                            <label for="address">Address </label>
                            <input type="text" name="address" id="address" value="${sessionScope.user.getAddress()}" required>
                        </div>
                        <div class="item-field dob-field">
                            <label for="dob">Date of birth (*)</label>
                            <input type="date" name="dob" id="dob" value="${sessionScope.user.getDob()}" required>
                        </div>
                    </div>

                    <div class="btn-container">
                        <button type="submit" id="update-btn">Update</button>
                        <button type="reset" id="cancel-btn" onclick="closePopup()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="./js/changeImageProfile.js"></script>
    </body>
</html>
