<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
           uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    
    <!--<script src="bootstrap-table/bootstrap-table.js"></script>-->

    <title>POS</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-table/bootstrap-table.css" rel="stylesheet" type="text/css" />
	

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/signin.css" rel="stylesheet">


  </head>

  <body>
	  <nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">POS Project</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav">
	            <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
	            <li class="active"><a href="#">Users</a></li>
	            <li><a href="#contact">Contact</a></li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
            	<li><a href="#">Logout</a></li>
           	</ul>
	        </div><!--/.navbar-collapse -->
	      </div>
	    </nav>

    <div class="container">
	</br>
	<h2>Users</h2>
	<div class="col-lg-6">
	   <div class="input-group">
	     <input type="text" class="form-control" placeholder="Search for...">
	     <span class="input-group-btn">
	       <button class="btn btn-default" type="button">Go!</button>
	     </span>
	   </div><!-- /input-group -->
	   
	</div><!-- /.col-lg-6 -->
	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#registrationModal">
		<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Register
	</button>
	<table class="table table-striped table-hover table-bordered" data-height="299" style="margin-top:30px;">
		<thead>
          <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Fullname</th>
            <th>User Type</th>
          </tr>
        </thead>
	        <tbody>
	        	<!-- insert logic for retrieving users -->
	        	<c:forEach items="${users}" var="user">
	        		<tr id="${user.id}" class="userRow">
			            <td class="userId">${user.id}</td>
			            <td class="userName"><c:out value="${user.username}" /></td>
			            <td class="userFullname"><c:out value="${user.fullname}" /></td>
			            <td class="userType">
			            	<c:choose>
							    <c:when test="${user.usertype=='1'}">Administrator</c:when>    
							    <c:otherwise>Cashier</c:otherwise>
							</c:choose>
			            </td>
		        	</tr>
		    	</c:forEach>
	        </tbody>
	  </table>
		
    </div> <!-- /container -->
    
    <!-- Add/Edit Prod Modal -->
	<div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Enter User Details</h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form id="registerUserForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/users?action=register" method="POST">
                  <div class="form-group">
                    <label  class="col-sm-4 control-label" for="inputEmail3">Username</label>
                    <div class="col-sm-7">
                    	<input type="hidden" class="form-user-id" name="userID" id="form-user-id">
                        <input type="text" class="form-control" id="inputUsername" name="username" placeholder="Enter username" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label" for="priceLabel">Fullname</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="inputFullname" name="fullname" placeholder="Enter fullname" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label" for="priceLabel">Password</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter password" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label" for="priceLabel">User Type</label>
                    <div class="col-sm-7">
                        <select class="form-control" name="userType" required>
						  	<option value="-1">-- Please Select --</option>
						    <option value="1">Administrator</option>
						    <option value="2">Cashier</option>
					  	</select>
                    </div>
                  </div>
                  <div class="form-group">
                  	<div class="col-sm-7">
		                  <label for="errorMessagse" id="errMsg" class="sr-only">Error Message</label>
		       		 	  <h5><% if(request.getAttribute("errorMessage")!=null){ out.println(request.getAttribute("errorMessage")); } %> </h5>
       		 	  	</div>
                  </div>
                  <div class="form-group">
                 	<div class="col-sm-10">
                 	 	<button class="btn btn-primary" type="submit" id="modalAddBtn" >Register User</button>
                 	 	<!-- <button class="btn btn-primary" type="submit" id="modalEditBtn" style="display: none;">Edit Product</button> -->
                 	 	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                 	</div>
                  </div>
                </form>
            </div>
            
        </div>
    </div>
	</div>
    
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>-->
	<script src="bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/products.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
  </body>
</html>