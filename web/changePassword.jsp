<%-- 
    Document   : changePassword
    Created on : Sep 25, 2023, 7:42:16 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login.css" rel="stylesheet">
    </head>
    <body style="background: linear-gradient(100deg, #17a2b8 -26.63%, #fff 100%)">
        <div class="login_body">
            <img src="image/register_login/purepng.com-childrenchildrenkidshuman-childchildhappy-kidsklds-1421526966161n4kvn.png" alt="" style="width: 70%;" />
            <div class="login_container" style="margin-left: -20px; margin-top: 200px;">
                <div class="login_headling" style="margin-left: -70px;">
                    <h1>Reset Password</h1>
                </div>
                <form class="login_form" action="change" method="post">
                    <div class="login_form_div">
                        <label>Email (*)</label><br/>
                        <input class="input" type="text" name="email" placeholder="Enter your email" required/>
                    </div>
                    <div class="login_form_div">
                        <label>Current Password (*)</label><br/>
                        <input class="input" type="password" name="oldpassword" placeholder="Enter your old password" required/>
                    </div>
                    <div class="login_form_div">
                        <label>New Password (*)</label><br/>
                        <input class="input" type="password" name="newpassword" placeholder="Enter your new password" required/>
                    </div>
                    <div class="login_form_div">
                        <label>Confirm Password(*)</label><br/>
                        <input class="input" type="password" name="repassword" placeholder="Confirm your new password" required/>
                    </div>
                    <div>
                        <p class="login_error">${requestScope.mess}</p>
                        <button class="login_btn-1" type="submit">Submit</button><br/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
