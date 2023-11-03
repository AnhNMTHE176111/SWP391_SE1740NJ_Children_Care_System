<%-- 
    Document   : feedback
    Created on : Oct 30, 2023, 5:01:12 PM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet"/>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="bannerHome.jsp"></jsp:include>

        <input type="hidden" name="id" value="hiddenValue">
        <h1 style="margin-left: 50px">Feedback Detail</h1>
        <form action="feedback" method="post" style="margin-bottom: 100px; padding-left: 100px">
            <label for="vote">Vote:</label>
            <select name="vote" id="vote">
                <option value="Excellent">Excellent</option>
                <option value="Good">Good</option>
                <option value="Average">Average</option>
                <option value="Poor">Poor</option>
            </select>
            <br>
            <label for="comment">Comment:</label><br>
            <textarea name="comment" id="comment" rows="4" cols="50" style="border-radius: 20px"></textarea>
            <br><br>
            <input type="submit" value="Submit" style="background-color: greenyellow">
        </form>
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>