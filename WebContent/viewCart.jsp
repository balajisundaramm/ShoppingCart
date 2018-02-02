<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cart</title>
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
	<%@ include file="userHeader.jsp" %>
	</div>
	<!--Dynamic table  -->
	<br />
		<div>
			<div>
				<h4>Items in your Cart : </h4>
			</div>
			<form id="cart" action="addTortDB.udo" method="get">
				<table class="table" id="empTable">
					<!-- <col width="10%">
					<col width="45%">
					<col width="20%">
					<col width="15%">
					<col width="10%"> -->
					<tr>
						<th></th>
						<th>Products</th>
						<th>Price</th>
						<th>No of units</th>
					</tr>
					<jstl:forEach items="${listOfProducts}" var="allProducts">
						<tr>
							<td><input id="check" type="checkbox" name="a"
								value="${allProducts.productName}"></td>
							<td>${allProducts.price}</td>
							<td>${allProducts.stock}</td>
							<td><input type="number" min=0 max='${allProducts.stock}'
								name="ad" id="old" size="2" disabled="disabled" /></td>
						</tr>
					</jstl:forEach>
				</table>
				<div class="col-sm-offset-10">
					<input id="addCart" type="submit" value="Add to Cart"
						class="btn btn-info" />
				</div>
			</form>
		</div>
</body>
</html>