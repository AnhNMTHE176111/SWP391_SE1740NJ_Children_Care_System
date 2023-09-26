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
        <link href="css/login.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #17a2b8 -10.63%, #fff 100%)">
        <% String mess="";
        if (request.getAttribute("mess") != null){
                mess= request.getAttribute("mess").toString();
            }
        %>
        <div class="login_body">
            <img src="./image/register_login/children_PNG17969.png" alt="" style="width: 40%;" />
            <div class="login_container">
                <div class="login_headling">
                    <h1>Welcome to Children Care System!</h1>
                    <h3>Track your health with us.</h3>
                </div>
<<<<<<< HEAD
                <form class="login-form" action="login" method="post">
                    <div class="login-form_ele">
=======
                <form class="login_form" action="login" method="post">
                    <div class="login_form_div">
>>>>>>> 4b82ac45f754cb7988434ad7536c97f28d300711
                        <label>Email</label><br />
                        <input class="input" type="email" name="email" placeholder="Input your Email" required/>
                    </div>
                    <div class="login_form_div">
                        <label>Password</label><br />
                        <input class="input" type="password" name="password" placeholder="Input your Password" required/>
                    </div>
                    <div class="login_form_div">
                        <input type="checkbox" />
                        <label>Remember me</label>
                        <a href="resetPassword.jsp" style="margin-left: 45px;">Forgot password?</a>
                        <p class="login_error"><%=mess%></p>
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
                    <a style="margin-left: 10px;" href="registerAccount.jsp">Create an account</a>
                </div>
            </div>
        </div>
    </body>
</html>
