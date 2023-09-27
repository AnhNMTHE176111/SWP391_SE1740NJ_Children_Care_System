<%-- 
    Document   : registerAccount
    Created on : Sep 21, 2023, 2:30:13 AM
    Author     : letie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/register.css" rel="stylesheet" />
    </head>
    <body style="background: linear-gradient(100deg, #fff 5%, #17a2b8 100%)">
        <div class="register_body">
            <img src="./image/register_login/child-12.png" alt="" style="width: 60%" />
            <div class="register_container">
                <div class="register_headling">
                    <h1>Create an account</h1>
                    <h3>Provide your details.</h3>
                </div>
                <form class="register_form" action="register" method="post">
                    <div class="register_form_div">
                        <label>First name (*)</label><br />
                        <input class="input" type="text" name="firstname" placeholder="Enter your firstname" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Last name (*)</label><br />
                        <input class="input" type="text" name="lastname" placeholder="Enter your lastname" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Email (*)</label><br />
                        <input class="input" type="text" name="email" placeholder="Enter your email" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Password(*)</label><br />
                        <input class="input" type="password" name="password" placeholder="Enter your password" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Re-Password (*)</label><br />
                        <input class="input" type="password" name="repassword" placeholder="Confirm your password" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Address</label><br />
                        <input class="input" type="text" name="address" placeholder="Enter your address"/>
                    </div>
                    <div class="register_form_div">
                        <label>Phone (*)</label><br />
                        <input class="input" type="text" name="phone" placeholder="Enter your phone number" required/>
                    </div>
                    <div class="register_form_div">
                        <label>Date of Birth (*)</label><br />
                        <input class="input" type="date" name="dob" placeholder="Enter your birthday" required/>
                    </div>
                    <div class="register_form_div">
                        <p>By signing up I agree to the <a href="#">terms & conditions</a> and<br>
                            <a href="#">privacy policy</a></p>
                        <p class="register_error">${requestScope.mess}</p>
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
                    <a href="https://www.google.com/">Login.</a>
                </div>
            </div>
        </div>
    </body>
</html>
