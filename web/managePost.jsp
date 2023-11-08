

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Manage Post </title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet"/>

    </head>

    <body>        



        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="background-color: #17a2b8" >
                    <div class="row">
                        <div class="col-sm-4">
                            <h1> <b> Post Management </b> </h1>
                        </div>
                        <div class="col-sm-4">
                            <a href="/manageDashboard" class="btn btn-lg btn-success" href="/home">Manage Dasboard</a>
                        </div>
                        <div class="col-sm-4">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Post</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>                                                    
                            <th>ID</th>                                         
                            <th>Title</th>                                      
                            <th>Banner</th>                                     
                            <!--                                <th>Created date</th>                               -->
                            <th>Actions</th>                                           
                        </tr>                                                   
                    </thead>

                    <tbody>                                                     
                        <c:forEach items="${listP}" var="o"> 

                            <tr>
                                <td><p style="font-size: 14px;">${o.postId}</p></td>
                                <td><a href="postDetail?postId=${o.postId}"> <p style="font-size: 14px;">${o.title}</p></td> </a> 
                                <td>
                                    <a href="postDetail?postId=${o.postId}"> <img style="width: 170px; height: 150px;" src="${o.getAvatar()}"> </a> 
                                </td>
<!--                                <td>${o.createdAt}</td>-->
                                <td>
                                    <a href="loadPost?pid=${o.postId}"  class="edit" data-toggle="modal"><p title="Edit">Edit</p></a>
                                    <a href="#" onclick="showMess(${o.postId})" class="delete" data-toggle="modal"><p title="Delete">Delete</p></a>     
                                </td>
                            </tr>
                          
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Add Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addPost" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Post</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>Title</label>
                                <input name="title" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Banner</label>
                                <input name="avatar" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Content</label>
                                <textarea name="content" class="form-control" required></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>




    </body>
    <script>
        function showMess(id) {
            var option = confirm('Do you want to delete Post with ID = ' + id);
            if (option === true) {
                window.location.href = 'deletePost?pid=' + id;
            }
        }
    </script>

</html>