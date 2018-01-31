<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Categories</title>
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

span {
	color: red;
}

input, textarea {
	width: 100%;
}
</style>
<script>
	$('document')
</script>

</head>
<body>
	<div class="container">
		<!-- include common header for admin portal  -->
		<%@ include file="userHeader.jsp"%>
		<!--Dynamic table for list of users.  -->
		<br />
		<div>
			<div>
				<h4>Category : ${categoryName}</h4>
			</div>
			<table class="table" id="empTable">
				<tr>
					<th><input type="checkbox" name="check"></th>
					<th>Products</th>
					<th>Price</th>
					<th>In Stock</th>
				</tr>
				<jstl:forEach items="${listOfProducts}" var="allProducts">
					<tr>
						<td><input type="checkbox" name="allProducts"
							value="${allProducts.productName}"></td>
						<td>${allProducts.productName}</td>
						<td>${allProducts.price}</td>
						<td>${allProducts.stock}</td>
					</tr>
				</jstl:forEach>
			</table>
			<div class="col-sm-offset-10">
				<button id="" type="button" class="btn btn-info" data-toggle="modal"
					data-target="#addCart">Add to Cart</button>
			</div>
		</div>
		<!--Modal for add to cart  -->
		<div class="modal fade" id="addCart" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Product Details</h4>
					</div>
					<div class="modal-content">
						<div>
							
						</div>
										
					</div>
					<div class="modal-footer">
						<a href="#" id="" class="btn btn-info">Add to cart</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>