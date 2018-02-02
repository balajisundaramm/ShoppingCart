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

input[type="checkbox"] {
	width: 15px; /*Desired width*/
	height: 20px; /*Desired height*/
}
</style>
<script>
	var index = 0;
	$(document).ready(function() {
		$('input[type=checkbox]').on('change', function() {
			if ($(this).is(':checked')) {
				$('#').val(null)
				$('#return').prop('disabled', 'disabled')
			}
		});

		var i = 0;

		$('input[type=checkbox]').each(function() {
			i++;
			var name = 'product_' + i;
			var id = 'id_' + i;
			$(this).attr('name', name);
			$(this).attr('id', id);
		});
		var x = 0;
		$('input[type=number]').each(function() {
			x++;
			var newID = 'number_' + x;
			var numId = 'num_id_' + x;
			$(this).attr('name', newID);
			$(this).attr('id', numId);
		});
		$('input').each(function(index, value) {
			$('#id_' + (index + 1)).on('click', function() {
				if ($(this).is(':checked')) {
					$('#num_id_' + (index + 1)).prop('disabled', false)
				} else {
					$('#num_id_' + (index + 1)).val('')
					$('#num_id_' + (index + 1)).prop('disabled', 'disabled')
				}

			});

		});
		$('#cart').submit(function(e) {
			e.preventDefault();
			var valid = true;
			var count = 0;
			$('input[type=checkbox]').each(function() {
				if ($(this).is(':checked')) {
					count++;
				}
			});
			if (count < 1) {
				valid = false;
				count = 0;
				alert("Select atleast a product.");
			}
			if (count > 2) {
				valid = false;
				count = 0;
				alert("Maximum 2 products only allowed at a time.");
			}
			if (valid) {
				(this).submit();
			}
		});

		/* $("input:checkbox").click(function(){
		    var group = "input:checkbox[name='"+$(this).prop("name")+"']";
		    $(group).prop("checked",false);
		    $(this).prop("checked",true);
		}); */

		//Same query but used .not
		/* $("input:checkbox").click(function(){
		    var group = "input:checkbox[name='"+$(this).prop("name")+"']";
		    $(group).not(this).prop("checked",false);
		}); */
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
			<div>
				<h4>Products :</h4>
			</div>
			<form id="cart" action="addToCartDB.udo" method="post">
			<table class="table" id="empTable">
				<col width="10%">
				<col width="45%">
				<col width="20%">
				<col width="15%">
				<col width="10%">
				<tr>
					<th></th>
					<th>Products</th>
					<th>Price</th>
					<th>In Stock</th>
					<th>Quantity</th>
				</tr>
				<jstl:forEach items="${allProducts}" var="allProducts">
					<tr>
						<td><input id="a" type="checkbox" name="allProducts"
							value="${allProducts.productName}"></td>
						<td>${allProducts.productName}</td>
						<td>${allProducts.price}</td>
						<td>${allProducts.stock}</td>
						<td><input type="number" min=0 max='${allProducts.stock}'
								name="ad" id="old" size="2" required disabled="disabled"  /></td>
					</tr>
				</jstl:forEach>
			</table>
			<div class="col-sm-offset-10">
				<input id="" type="submit" value="Add to Cart" class="btn btn-info"/>
			</div>
		</div>
	</div>
</body>
</html>