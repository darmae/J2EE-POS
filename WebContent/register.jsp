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

    <title>POS - Register</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">-->

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! 
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- <script src="../../assets/js/ie-emulation-modes-warning.js"></script>-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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

    <div class="container"></br> </br>
			<form action="${pageContext.request.contextPath}/register" class="form-signin" method="POST">
				<div class="form-group">
			      <label for="username">Username:</label>
			      <input type="username" class="form-control" name="username" placeholder="Enter username" required>
			    </div>
				<div class="form-group">
			      <label for="fullname">Fullname:</label>
			      <input type="fullname" class="form-control" name="fullname" placeholder="Enter fullname" required>
		    	</div>
			    <div class="form-group">
			      <label for="pwd">Password:</label>
			      <input type="password" class="form-control" name="password" placeholder="Enter password" required>
			    </div>
			    <div class="form-group">
				  <label for="sel1">User Type:</label>
				  <select class="form-control" name="userType" required>
				  	<option value="-1">-- Please Select --</option>
				    <option value="1">Administrator</option>
				    <option value="2">Cashier</option>
				  </select>
				</div>
		   		<button type="submit" class="btn btn-lg btn-success btn-block">Submit</button>	
			</form>
    </div> <!-- /container -->
    
    

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug 
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
  </body>
</html>
