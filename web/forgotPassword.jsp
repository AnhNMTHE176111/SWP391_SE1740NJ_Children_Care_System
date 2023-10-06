<%-- 
    Document   : resetPassword
    Created on : Sep 21, 2023, 2:29:48 AM
    Author     : letie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #17a2b8 -26.63%, #fff 100%)">
        <div class="login_body">
            <img src="image/register_login/R.png" alt="" style="width: 40%;" />
            <div class="login_container" style="margin-left: 200px; margin-top: 250px;">
                <div class="login_headling" style="margin-left: 100px;">
                    <h1>Forgot Password ?</h1>
                    <h3>Let us help you recover your password.</h3>
                </div>
                <form class="login_form" action="forgot" method="post">
                    <div class="login_form_div">
                        <label>Input your email to reset password</label><br/>
                        <input class="input" type="email" name="email" placeholder="Enter your email here" required/>
                    </div>
                    <div>
                        <button class="login_btn-1" type="submit">Send Email</button><br/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
