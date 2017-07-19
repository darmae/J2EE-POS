<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="beans.ProductBean"%>
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
          	</ul>
          	<ul class="nav navbar-nav navbar-right">
            	<li><a href="#">Logout</a></li>
           	</ul>
	        </div><!--/.navbar-collapse -->
	      </div>
	    </nav>

    <div class="container">
	</br>
	<h3>Transactions</h3></br>
	<!--<div class="col-lg-6">
	   <div class="input-group">
	     <input type="text" class="form-control" placeholder="Search for...">
	     <span class="input-group-btn">
	       <button class="btn btn-default" type="button">Go!</button>
	     </span>
	   </div><!-- /input-group 
	   
	</div> /.col-lg-6
	<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalHorizontal">
		<span class="glyphicon glyphicon-plus addBtn" aria-hidden="true"></span>  Add
	</button>-->
	<div class="col-lg-6">
	<div class="panel panel-primary" style="max-width:100%; margin:0px;">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><b>PRODUCTS LIST</b></div>
		  <div class="tbl-limit" style="height:720px !important; overflow: scroll;">
			<table class="table table-striped table-hover table-bordered" style="max-height:10%; overflow: scroll;">
				<thead>
		          <tr>
		            <th>ID</th>
		            <th>Name</th>
		            <th>Price (PHP)</th>
		            <th>Add item</th>
		          </tr>
		        </thead>
			        <tbody>
			        	<c:forEach items="${products}" var="product">
			        		<tr id="${product.id}" class="prodRow">
					            <td class="prodId">${product.id}</td>
					            <td class="prodName"><c:out value="${product.name}" /></td>
					            <td class="prodPrice"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}" /></td>
					            <td data-events="actionEvents">
					            	<button type="button" class="btn btn-info addCartBtn" name="edit" >
					            		<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
					            	</button> 
								</td>
				        	</tr>
				    	</c:forEach>
			        </tbody>
			  </table>
			  </div><!-- tbl-limit --> 
		</div><!-- /panel -->  
		</div>
	<div class="col-lg-6">
	  <div class="panel panel-danger" style="max-width:100%;">
		  <!-- Default panel contents -->
		  <div class="panel-heading" style="height:50px;"><b>ORDER LIST</b>
		  		<button type="button" class="btn btn-danger payBtn" style="text-align: right; float:right; " data-toggle="modal" data-target="#">
		  			<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>  PAY
		  		</button>
		  </div>
		  <div class="tbl-limit" style="height:450px !important; overflow: scroll;">
		  <table class="table table-striped table-hover table-bordered" style="" id="table-orderList">
			<thead>
	          <tr>
	            <th>Product</th>
	            <th>Price (PHP)</th>
	            <th>Quantity</th>
	            <th>Sub-total</th>
	            <th>Remove</th>
	          </tr>
	        </thead>
		        <tbody class="cart-contents">
		        <tr style="display:none;">
		        	<td> </td>
		        	<td></td>
		        	<td><input type="number" class="form-control" style="width:60px;" id="inputQtyTbl" name="qty" placeholder="Quantity" required value="1"/></td>
		        	<td></td>
		        	<td><button type="button" class="btn btn-default remCartBtn" name="remove${product.id}" id="remBtnId" >
	            			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	            		</button> 
	            	</td>
		        </tr>
		        </tbody>
		  </table>
		  </div><!-- /tbl-limit -->
		</div><!-- /panel -->
		
		<div class="panel panel-default" style="max-height:100%; height:240px;" id="paymentPanel">
		  <!-- Default panel contents -->
		  <div class="panel-heading" style="height:50px;"><b>PAYMENT</b>
		  </div>
			<table style="margin-left:10px; margin-top:20px; width:80%" class="tbl-payment">
				<tr>
					<th><h4>Balance Due:</h4></th>					
					<td id="amountPayable" class="money"><span id="amtPayableData"><h4><b>0.00</b></h4></span></td>
				</tr>
				<tr>
					<th><h4>Enter amount: </h4></th>
					<td id="money">
						<input type="text" class="form-control" style="width:100px;" disabled id="moneyFld" placeholder="0.00" required />
					</td>		
					<td>
						<button type="button" class="btn btn-default enterAmountBtn" disabled id="moneyButton" >
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>   OK</button> 
					</td>			
				</tr>
				<tr>
					<th><h4>Change: </h4></th>
					<td id="changeDue"><h4><b>0.00</b></h4></td>
					<td><form action="${pageContext.request.contextPath}/transactions" method="GET">
						<button type="submit" class="btn btn-default" disabled id="newTrans">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  New transaction</button>
					</form> </td>
				</tr>
			</table>
		</div>
		
		</div><!-- col-lg-6 -->
    </div> <!-- /container -->
    
    <!-- Amount Modal -->
	<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Payment</h4>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <!--  <form id="qtyForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/transactions?action=add&prodID=<c:out value="${product.id}"/>" method="POST"> 
                	<form id="qtyForm" class="form-horizontal" role="form" action="/transactions" method="POST">   -->
                  <div class="form-group">
                    <label class="col-sm-4 control-label"for="stockLabel">Enter amount</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control"  id="inputAmount" name="amount" placeholder="Amount" required value="1"/>
                    </div>
                  </div>
                  <div class="modal-footer">
               	 	<button type="button" class="btn btn-primary">OK</button>
               	 	<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  </div>
                <!-- </form>  -->
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