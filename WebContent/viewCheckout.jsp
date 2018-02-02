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
			<form id="cart" action="showChechout.udo" method="get">
				<table class="table" id="empTable">
					<col width="10%">
					<col width="45%">
					<col width="20%">
					<col width="15%">
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
						</tr>
					</jstl:forEach>
				</table>
				<div class="col-sm-offset-8 col-sm-2">
					<input id="addCart" type="submit" value="Chech out"
						class="btn btn-info" />
				</div>
			</form>
			<div class="col-sm-offset-10">
				<button class="btn btn-info"
					onclick="location.href='showCart.udo';';">Cancel</button>
			</div>
		</div>
	</div>
</body>
</html>