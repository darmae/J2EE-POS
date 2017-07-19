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
            <li class="active"><a href="#">Products</a></li>
            <li><a href="${pageContext.request.contextPath}/users?action=listUser">Users</a></li>
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
	<h3>Manage Products</h3></br>
	<div class="col-lg-6" style="padding-left:0px; padding-bottom:20px;">
	   <div class="input-group">
	     <input type="text" class="form-control" placeholder="Search for...">
	     <span class="input-group-btn">
	       <button class="btn btn-default" type="button">Go!</button>
	     </span>
	   </div><!-- /input-group -->	   
	</div><!-- /.col-lg-6 -->
	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalHorizontal">
		<span class="glyphicon glyphicon-plus addBtn" aria-hidden="true"></span>  Add
	</button></br>
	
	<table class="table table-striped table-hover table-bordered" data-height="299">
		<thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (PHP)</th>
            <th>Stock</th>
            <th>Action</th>
          </tr>
        </thead>
	        <tbody>
	        	<c:forEach items="${products}" var="product">
	        		<tr id="${product.id}" class="prodRow">
			            <td class="prodId">${product.id}</td>
			            <td class="prodName"><c:out value="${product.name}" /></td>
			            <td class="prodPrice"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></td>
			            <td class="numStocks"><c:out value="${product.quantity}" /></td>
			            <td data-events="actionEvents">
			            	<button type="button" class="btn btn-warning eBtn" name="edit${product.id}" >
			            		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			            	</button> 
							<button type="button" class="btn btn-danger deleteBtn"><span class="glyphicon glyphicon-trash" aria-hidden="true" ></span></button>
							<!-- </form> -->
						</td>
		        	</tr>
		    	</c:forEach>
	        </tbody>
	  </table>
	
    </div> <!-- /container -->
    
    <!-- Add/Edit Prod Modal -->
	<div class="modal fade" id="myModalHorizontal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Enter Product Details</h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form id="addEditProdForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/addProd" method="POST">
                  <div class="form-group">
                    <label  class="col-sm-4 control-label" for="inputEmail3">Product name</label>
                    <div class="col-sm-7">
                    	<input type="hidden" class="form-prod-id" name="prodID" id="form-prod-id">
                        <input type="text" class="form-control" id="inputProdName" name="prodName" placeholder="Product name" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label" for="priceLabel" >Product Price</label>
                    <div class="col-sm-7">
                        <input type="number" class="form-control" id="inputProdPrice" name="prodPrice" placeholder="Product Price" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"for="stockLabel" >No. of stocks</label>
                    <div class="col-sm-7">
                        <input type="number" class="form-control"  id="inputNumStocks" name="quantity" placeholder="No. of stocks" required/>
                    </div>
                  </div>
                  <div class="form-group">
                  	<div class="col-sm-7">
		                  <label for="errorMessagse" id="errMsg" class="sr-only">Error Message</label>
		       		 	  <h5><% if(request.getAttribute("errorMessage")!=null){ out.println(request.getAttribute("errorMessage")); } %> </h5>
       		 	  	</div>
                  </div>
                  <div class="modal-footer">
               	 	<button class="btn btn-primary" type="submit" id="modalAddBtn" >Add Product</button>
               	 	<button class="btn btn-primary" type="submit" id="modalEditBtn" style="display: none;">Edit Product</button>
               	 	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  </div>
                </form>
            </div>
            
        </div>
    </div>
	</div>
	
	<!-- Delete Modal -->
	  <div class="modal fade" id="deleteProdModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Delete Product</h4>
	        </div>
	        <div class="modal-body">
	          <p id="delProdName"></p>
	        </div>
	        <div class="modal-footer">
	           <form action="${pageContext.request.contextPath}/productCtrl?action=delete&userType=1&prodID=<c:out value="${product.id}"/>" method="POST" id="delForm">  
	          <!--<form action="${pageContext.request.contextPath}/deleteProd" method="POST" id="delForm">
	          	  <input type="hidden" name="prodID" id="del-prod-id">-->
		          <button type="submit" class="btn btn-primary">Delete product</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
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
