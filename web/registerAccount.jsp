<%-- 
    Document   : registerAccount
    Created on : Sep 21, 2023, 2:30:13 AM
    Author     : letie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/register.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #fff 5%, #17a2b8 100%)">
        <div class="register_body">
            <img src="image/register_login/purepng.com-childrenchildrenkidshuman-childchildhappy-kidsklds-1421526966161n4kvn.png" alt="" style="width: 60%" />
            <div class="register_container">
                <div class="register_headling">
                    <h1>Create an account</h1>
                    <h3>Provide your details.</h3>
                </div>
                <form class="register_form">
                    <div class="register_form_div">
                        <label>Your name</label><br />
                        <input class="input" type="text" />
                    </div>
                    <div class="register_form_div">
                        <label>Email</label><br />
                        <input class="input" type="email" />
                    </div>
                    <div class="register_form_div">
                        <label>Password</label><br />
                        <input class="input" type="password" />
                    </div>
                    <div class="register_form_div">
                        <p>By signing up I agree to the <a href="#">terms & conditions</a> and<br>
                            <a href="#">privacy policy</a></p>
                    </div>
                    <div>
                        <button class="register_btn-1" type="submit">Create An Account</button><br />
                        <button class="register_btn-2">
                            <img src="image/register_login/google.png" alt="" style="width: 5%" />
                            <a href="https://accounts.google.com/InteractiveLogin" style="padding-left: 2px; color:#fff; text-decoration: none;"
                               >Or continue with Google</a
                            ></button
                        ><br />
                    </div>
                </form>
                <div class="register_footer">
                    <label>Already a Member?</label>
                    <a href="https://www.google.com/">Sign In.</a>
                </div>
            </div>
        </div>
    </body>
</html>
