<%-- 
    Document   : login
    Created on : Sep 16, 2023, 11:08:57 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/login.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #17a2b8 -10.63%, #fff 100%)">
        <div class="login_body">
            <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
            <img src="./image/register_login/children_PNG17969.png" alt="" style="width: 40%;" />
            <div class="login_container">
                <div class="login_headling">
                    <h1>Welcome to Children Care System!</h1>
                    <h3>Track your health with us.</h3>
                </div>
                <form class="login_form" action="login" method="post">
                    <div class="login_form_div">
                        <label>Email</label><br />
                        <input class="input" type="email" name="email" placeholder="Enter your email" value="${cookie.cEmail.value}" required/>
                    </div>
                    <div class="login_form_div">
                        <label>Password</label><br />
                        <input class="input" type="password" name="password" placeholder="Enter your password" value="${cookie.cPass.value}" required/>
                    </div>
                    <div class="login_form_div">
                        <input type="checkbox" name="remember" value="ON" value="${(cookie.cRemember!=null?'checked':'')}"/>
                        <label>Remember me</label>
                        <a href="forgotPassword.jsp" style="margin-left: 60px;">Forgot password?</a>
                        <p class="login_error">${requestScope.mess}</p>
                        <p class="login_success">${requestScope.mess1}</p>
                    </div>
                    <div>
                        <button class="login_btn-1" type="submit">Sign In</button><br />
                        <button class="login_btn-2">
                            <img src="image/register_login/google.png" alt="" style="width: 5%" />
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:9999/SWP391_SE1740NJ_Children_Care_System/index.jsp&response_type=code&client_id=735170124292-pime0tfh1hos9ffg380454ugslgq0te8.apps.googleusercontent.com&approval_prompt=force" style="padding-left: 2px; color:#fff; text-decoration: none;"
                               >Or continue with Google</a
                            ></button
                        ><br />
                    </div>
                </form>
                <div class="login_footer">
                    <label>Do not have an account?</label>
                    <a style="margin-left: 10px;" href="registerAccount.jsp">Create an account.</a>
                </div>
            </div>
        </div>
    </body>
</html>
