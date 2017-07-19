/*
$(document).on('click', '.addBtn', function () {
//    var tr = $(this).closest('.prodRow');
//    var prodId = tr.find('.prodId').text();
//    var prodName = tr.find('.prodName').text();
//    var prodPrice = tr.find('.prodPrice').text();
//    var numStocks = tr.find('.numStocks').text();

    $("#myModalHorizontal").modal();
    document.getElementById("inputProdName").value = "";
    document.getElementById("inputProdPrice").value = "";
    document.getElementById("inputNumStocks").value = "";
    document.getElementById("modalAddBtn").style.display = 'inline';
    document.getElementById("modalEditBtn").style.display = 'none';
    var action = document.getElementById("addEditProdForm").action;
    action = "http://localhost:8080/POS/addProd";
    document.getElementById("addEditProdForm").action = action;
//    alert(action);
//    document.getElementById("form-prod-id").value = prodId;
}); */


$(document).on('click', '.eBtn', function () {
    var tr = $(this).closest('.prodRow');
    var prodId = tr.find('.prodId').text();
    var prodName = tr.find('.prodName').text();
    var prodPrice = tr.find('.prodPrice').text();
    var numStocks = tr.find('.numStocks').text();

    $("#myModalHorizontal").modal();
    document.getElementById("inputProdName").value = prodName;
    document.getElementById("inputProdPrice").value = prodPrice;
    document.getElementById("inputNumStocks").value = numStocks;
    document.getElementById("modalAddBtn").style.display = 'none';
    document.getElementById("modalEditBtn").style.display = 'inline';
    var action = document.getElementById("addEditProdForm").action;
    action = "http://localhost:8080/POS/editProd";
    document.getElementById("addEditProdForm").action = action;
//    alert(action);
    document.getElementById("form-prod-id").value = prodId;
});

$(document).on('click', '.deleteBtn', function () {
	var tr = $(this).closest('.prodRow');
	var prodId = tr.find('.prodId').text();
	var prodName = tr.find('.prodName').text();
	$("#deleteProdModal").modal();
//	document.getElementById("del-prod-id").value = prodId;
	document.getElementById("delProdName").innerHTML = "Are you sure you want to delete " + prodName + "? ";
	var action = document.getElementById("delForm").action;
	document.getElementById("delForm").action = action + prodId;
	
});

$(document).on('click', '.addCartBtn', function () {
	var tr = $(this).closest('.prodRow');
    var prodId = tr.find('.prodId').text();
    var prodName = tr.find('.prodName').text();
    var price = tr.find('.prodPrice').text();
    
    var test = document.getElementById("table-orderList").insertRow(-1);
    test.id = prodId;
    test.innerHTML = '<tr style="" class="lala"  id="' + prodId +'"><td>' + prodName + '</td><td>' + price + '</td>' +
	'<td><input type="number" class="form-control qtyInput" style="width:60px;" id="inputQtyTbl" name="qty" placeholder="Quantity" required value="1"/></td>' + 
	'<td>' + price + '</td><td><button type="button" class="btn btn-danger btn-sm btn-round remCartBtn" name="remove" id="remBtnId" >' +
	'<span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></td></tr>';
    
});

$(document).on('click', '.remCartBtn', function () {
    $(this).closest('tr').remove();
    
});

$(document).on('click', '.enterAmountBtn', function () {
	var orderTbl = document.getElementById("table-orderList");
	var amt = parseFloat(document.getElementById("moneyFld").value);
	//TODO change to double????
	var subtotal=0.00;
	if(orderTbl.rows.length>2){		
		var colVal, x=0;
		for (var i=2, row; i<orderTbl.rows.length; i++) {
			row=orderTbl.rows[i];
			colVal=row.cells[3].innerHTML;
			subtotal = subtotal + parseFloat(colVal);		   			
		}
		subtotal = parseFloat(subtotal);
		console.log("sub total: " + subtotal);
		console.log("amt: " + amt);
		if(amt!="" && subtotal>amt){
			alert("Amount is insufficient.");
		}else{
			var change = amt-subtotal;
			console.log("change due: " + change);
			document.getElementById("changeDue").innerHTML = '<h4><b>' + change + '.00</b></h4>';
			document.getElementById("newTrans").disabled = false;
			document.getElementById("newTrans").classList.remove('btn-default');
			document.getElementById("newTrans").classList.add('btn-primary');
			
			document.getElementById("moneyButton").classList.remove('btn-success');
			document.getElementById("moneyButton").classList.add('btn-default');
			document.getElementById("moneyButton").disabled = true;
			document.getElementById("moneyFld").disabled = true;
		}		
	}	
});


//TODO ON CHANGE VALUE
//$(document).on('click', '.qtyInput', function () {
//    $(this).closest('tr').remove();
//    
//});

$(document).on('click', '.payBtn', function () {
	var orderTbl = document.getElementById("table-orderList");
	if(orderTbl.rows.length>2){
		var subtotal=0.00;
		var colVal, x=0;
		for (var i=2, row; i<orderTbl.rows.length; i++) {
			row=orderTbl.rows[i];
			colVal=row.cells[3].innerHTML;
			subtotal = subtotal + parseFloat(colVal);		   			
		}
		console.log("tbl len " + orderTbl.rows.length);
		console.log("summation " + subtotal);
		
		//TODO GET CLASS
		document.getElementById("paymentPanel").classList.remove('panel-default');
		document.getElementById("paymentPanel").classList.add("panel-success");
//		document.getElementById("amountPayable").innerHTML = subtotal + ".00";
		document.getElementById("amtPayableData").innerHTML = '<h4><b>' + subtotal + '.00</b></h4>';
		document.getElementById("moneyFld").disabled = false;
		document.getElementById("moneyButton").disabled = false;
		document.getElementById("moneyButton").classList.remove('btn-default');
		document.getElementById("moneyButton").classList.add('btn-success');
		
	}	
	else{
		alert("No products in Order List");
	}
	
});
