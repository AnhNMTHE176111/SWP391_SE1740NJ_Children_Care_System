<%-- 
    Document   : login
    Created on : Sep 16, 2023, 11:08:57 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login_resigter.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #17a2b8 -26.63%, #fff 100%)">
        <% String mess="";
        if (request.getAttribute("mess") != null){
                mess= request.getAttribute("mess").toString();
            }
        %>
        <div class="login-body">
            <img src="./img/children_PNG17969.png" alt="" style="width: 40%" />
            <div class="login">
                <div class="login-header">
                    <h1>Welcome to Children Care System!</h1>
                    <h3>Track your health with SportsCo.</h3>
                </div>
                <form class="login-form" action="login" method="post">
                    <div class="login-form_ele">
                        <label>Email</label><br />
                        <input class="input" type="text" name="email" required/>
                    </div>
                    <div class="login-form_ele">
                        <label>Password</label><br />
                        <input class="input" type="password" name="password" required/>
                    </div>
                    <div class="login-form_ele">
                        <input type="checkbox" />
                        <label>Remember me</label>
                        <a href="#" style="margin-left: 45px;">Forgot password?</a><!-- comment -->
                        <p class="error-mess"><%=mess%></p>
                        <p class="ss-mess">${requestScope.mess1}</p>
                    </div>
                    <div>
                        <button class="btn-1" type="submit">Sign In</button><br />
                        <button class="btn-2">
                            <img src="img/google.png" alt="" style="width: 5%" />
                            <a href="https://accounts.google.com/InteractiveLogin" style="padding-left: 2px; color:#fff; text-decoration: none;"
                               >Or continue with Google</a
                            ></button
                        ><br />
                    </div>
                </form>
                <div class="login-footer">
                    <label>New to SportsCo</label>
                    <a style="margin-left: 10px;" href="https://www.google.com/">Create an account</a>
                </div>
            </div>
        </div>
    </body>
</html>
