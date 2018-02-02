<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Products</title>
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
input[type="checkbox"]{
  width: 15px; /*Desired width*/
  height: 20px; /*Desired height*/
}
</style>
<script>
$(document).ready(function() {
	$("input:checkbox").click(function(){
	    var group = "input:checkbox[name='"+$(this).prop("name")+"']";
	    $(group).prop("checked",false);
	    $(this).prop("checked",true);
	});
});
</script>

</head>
<body>
	<div class="container">
		<!-- include common header for admin portal  -->
		<%@ include file="userHeader.jsp"%>

		<!--Dynamic table for list of users.  -->
		<br />
		<div>
			<div><h4>Products : </h4></div>
			<table class="table" id="empTable">
				<tr>
					<th></th>
					<th>Products</th>
					<th>Price</th>
					<th>In Stock</th>
				</tr>
				<jstl:forEach items="${allProducts}" var="allProducts">
					<tr>
						<td><input type="checkbox" name="allProducts" value="${allProducts.productName}"></td>
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
	</div>
</body>
</html>