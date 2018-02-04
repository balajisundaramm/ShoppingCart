<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Checkout</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
	margin: 5%;
	background-image: url("images/shopping1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}

input, textarea {
	width: 100%;
}
</style>
<script>
	$('document').ready(function() {
		var i = 0;
		$('input').each(function() {
			i++;
			var id = 'price_' + i;
			$(this).attr('id', id);
		});
		var total = 0;
		$('input').each(function(index, value) {
			var temp = parseInt($('#price_' + (index + 1)).val());
			total = total + temp;
			console.log("total " + total);
		});
		document.getElementById("result").innerHTML = total;
	});
</script>
</head>
<body>
	<div class="container">
		<!-- include common header for admin portal  -->
		<%@ include file="userHeader.jsp"%>
		<!--Dynamic table  -->
		<br />
		<div>
			<div>
				<h4>Items in your Checkout :</h4>
			</div>
			<table class="table" id="empTable">
				<col width="40%">
				<col width="25%">
				<col width="25%">
				<col width="10%">
				<tr>
					<th>Products</th>
					<th>Price</th>
					<th>No of units</th>
					<th>Delete</th>
				</tr>
				<jstl:forEach items="${checkoutList}" var="allProducts">
					<tr>
						<td>${allProducts.productName}</td>
						<td>${allProducts.price}</td>
						<td>${allProducts.quantity}</td>
						<td><a id=""
							href="deleteCheckoutProduct.udo?productName=${allProducts.productName}"
							class="delete btn btn-primary btn-xs"
							onclick="return confirm('Are you sure you want to delete this product from checkout?');">
								<span class="glyphicon glyphicon-trash"></span>
						</a></td>
						<input type="hidden" id="price" value="${allProducts.price}" />
					</tr>
				</jstl:forEach>
			</table>
			<div class="col-sm-offset-8 col-sm-2">
				<button id="addCart" class="btn btn-info" data-toggle="modal"
					data-target="#checkout">Check out</button>
			</div>
			<div class="col-sm-offset-10">
				<button class="btn btn-info" onclick="location.href='showCart.udo';">Cancel</button>
			</div>
		</div>
		<!-- Confirmation modal  -->
		<div class="modal fade" id="checkout" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Thank You!</h4>
					</div>
					<div class="modal-body">
						<%-- <%
							if (request.getParameter("data") != null) {
						%>
						Your value:
						<%=request.getParameter("data")%>
						<%
							}
						%> --%>
						<h5>
							We are pleased to serve you! <b>Please make a payment of Rs</b>
						</h5>
						<h5 >
						<b id="result"></b>
						</h5>
					</div>
					<div class="modal-footer">
						<button type="button" id="userReg" onclick="location.href='home.udo';" class="btn btn-info">Okay</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>