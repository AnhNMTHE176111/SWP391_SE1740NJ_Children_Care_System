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
        <div class="col-12 d-flex justify-content-center">
            <div class="col-10">
                <% 
                  String medicalInfoId = request.getParameter("feedbackId");
                  String doctorId = request.getParameter("doctorId");
                  String id = request.getParameter("id");
                  if (medicalInfoId != null && !medicalInfoId.isEmpty()) {
                %>
                <h1>Feedback Detail</h1>
                <form action="feedback" method="post">
                    <input type="text" name="medicalInfoId" value="<%= medicalInfoId %>" hidden/>
                    <input type="text" name="doctorId" value="<%= doctorId %>" hidden/>
                    <input type="text" name="id" value="<%= id %>" hidden/>
                    <label for="vote">Vote:</label>
                    <select name="vote" id="vote" class="form-control col-3">
                        <option value="Excellent" ${feedback.getRatingValue() eq 'Excellent' ? 'selected' : ''}>Excellent</option>
                        <option value="Good" ${feedback.getRatingValue() eq 'Good' ? 'selected' : ''}>Good</option>
                        <option value="Average" ${feedback.getRatingValue() eq 'Average' ? 'selected' : ''}>Average</option>
                        <option value="Poor" ${feedback.getRatingValue() eq 'Poor' ? 'selected' : ''}>Poor</option>
                    </select>
                    <br>
                    <label for="comment">Comment: </label><br>
                    <input name="comment" id="comment" class="col-3 form-control p-3"
                              value="${feedback.getComment()}"
                              style="border-radius: 20px; padding: 7px" />
                    <br><br>
                    <input type="submit" class="btn btn-success" value="Submit" >
                </form>
                <% } %>
            </div>
        </div>
    </body>
</html>