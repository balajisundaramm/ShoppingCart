<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>
<head>
<title>Categories</title>
<meta charset="UTF-8">
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
	$(document).ready(function() {
		$(".editProduct").on('click', function () {
			$('#editProduct').modal('show');
		});
	});
</script>
</head>
<body>
	<div class="container">
		<!-- include common header for admin portal  -->
		<%@ include file="header.jsp"%>
		<!--Category   -->
		<br />
		<div class=" row col-sm-12">
			<div class="col-sm-3">
				<h3>${categoryName}</h3>
			</div>

			<div class="col-sm-1">
				<button type="button" class="edit btn btn-warning"
					id="${categoryName}" data-toggle="modal"
					data-target="#editCategory">
					<span class="glyphicon glyphicon-edit"></span>
				</button>
			</div>
			<div class="col-sm-1">
				<a id="" href="deleteCategory.ado?categoryName=${categoryName}"
					class="delete btn btn-warning"
					onclick="return confirm('Are you sure you want to delete this Category?');">
					<span class="glyphicon glyphicon-trash"></span>
				</a>
			</div>
		</div>
		<!--Dynamic table for list of users.  -->
		<div>
			<table class="table" id="empTable">
				<tr>
					<th>Products</th>
					<th>Price</th>
					<th>In Stock</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<jstl:forEach items="${listOfProducts}" var="products">
					<tr>
						<td>${products.productName}</td>
						<td>${products.price}</td>
						<td>${products.stock}</td>
						<%-- <td>
							<button type="button" class="editProduct btn btn-warning" id="${products.productName}"
								data-toggle="modal" data-target="#editProduct">
								<span class="glyphicon glyphicon-edit"></span>
							</button>
						</td> --%>
						<td>
							<a href="editProduct.ado?productName=${products.productName}
						&categoryName=${categoryName}" class="editProduct btn btn-warning" id="${products.productName}">
<!-- 								data-toggle="modal" data-target="#editProduct">
 -->								<span class="glyphicon glyphicon-edit"></span>
							</a>
						</td>
						<td><a id=""
							href="deleteProduct.ado?productName=${products.productName}
						&categoryName=${categoryName}"
							class="delete btn btn-warning"
							onclick="return confirm('Are you sure you want to delete this product?');">
								<span class="glyphicon glyphicon-trash"></span>
						</a></td>
					</tr>
				</jstl:forEach>
			</table>
			<br />
			<hr>
			<div class="col-sm-offset-10">
				<button id="" type="button" class="btn btn-info" data-toggle="modal"
					data-target="#addProduct">Add Product</button>
			</div>
		</div>

		<!-- Modal for add Products  -->
		<div class="modal fade" id="addProduct" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Product</h4>
					</div>
					<form id="addCategory" class="modalview" action="addProductInt.jsp"
						method="post">
						<div class="modal-body">
							<div class="col-sm-4">
								<lable>Catagory Name : <span>*</span></lable>
							</div>
							<!-- <div class="col-sm-8">
								<input type="text" id="uname" name="categoryName"
									class="addInputs" placeholder="Enter admin" required><br />
								<br />
							</div> -->
							<div class="col-sm-8">
								<select name="categoryName">
									<jstl:forEach items="${category}" var="categoryN">
										<option value="${categoryN.categoryName}">${categoryN.categoryName}</option>
									</jstl:forEach>
								</select>
							</div>
							<br />
							<div class="col-sm-4">
								<lable>Product Name : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="text" id="productName" name="productName" class="addInputs"
									placeholder="Enter admin" required><br /> <br />
							</div>
							<div class="col-sm-4">
								<lable>Description:<span>*</span> </lable>
							</div>
							<div class="col-sm-8">
								<textarea rows="5" cols="255" maxlength="45"
									placeholder="Description" name="description">
							</textarea>
								<br />
							</div>
							<div class="col-sm-4">
								<lable>Price : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="number" min="0" name="price" class="addInputs"
									placeholder="Enter admin" required><br /> <br />
							</div>
							<div class="col-sm-4">
								<lable>In Stock : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="number" id="" min="0" name="stock"
									class="addInputs" placeholder="Enter admin" required><br />
								<br />
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" id="" class="btn btn-info">Add
								Product</button>
							<button type="reset" id="clear" class="btn btn-danger">Clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--Modal for edit category-->
		<div class="modal fade" id="editCategory" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Category</h4>
					</div>
					<form id="addCategory" class="modalview"
						action="addCategoryInt.jsp" method="post">
						<div class="modal-body">
							<div class="col-sm-3">
								<lable>Catagory Name : <span>*</span></lable>
							</div>
							<div class="col-sm-9">
								<input type="text" id="editCategoryName" name="categoryName"
									class="addInputs" value="${categoryName}" readonly="readonly"><br />
								<br />
							</div>
							<div class="col-sm-3">
								<lable>Description:<span>*</span> </lable>
							</div>
							<jstl:forEach items="${category}" var="category">
								<%-- 								<a href="category.ado?categoryName=${category.categoryName}">${category.categoryName}</a>
								<br /> --%>
								<jstl:if test="${category.categoryName}=='${categoryName}'">

								</jstl:if>
							</jstl:forEach>
							<div class="col-sm-9">
								<textarea id="editCategoryDescription" rows="5"
									maxlength="50000" name="categoryDescription"
									required="required">${categoryDescription}
								</textarea>
							</div>


						</div>

						<div class="modal-footer">
							<button type="submit" id="" class="btn btn-info">Save</button>
							<button type="reset" id="clear" class="btn btn-danger">Clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Modal for edit Product details  -->
		<div class="modal fade" id="editProduct" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Product</h4>
					</div>
					<form id="addCategory" class="modalview" action="addProductInt.jsp"
						method="post">
						<div class="modal-body">
							<div class="col-sm-4">
								<lable>Catagory Name : <span>*</span></lable>
							</div>
							<!-- <div class="col-sm-8">
								<input type="text" id="uname" name="categoryName"
									class="addInputs" placeholder="Enter admin" required><br />
								<br />
							</div> -->
							<div class="col-sm-8">
								<select name="categoryName">
									<jstl:forEach items="${category}" var="categoryN">
										<option value="${categoryN.categoryName}">${categoryN.categoryName}</option>
									</jstl:forEach>
								</select>
							</div>
							<br />
							<div class="col-sm-4">
								<lable>Product Name : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="text" id="" name="productName" class="addInputs"
									<%-- value="${listOfProducts.productName }" --%> readonly="readonly"><br /> <br />
							</div>
							<div class="col-sm-4">
								<lable>Description:<span>*</span> </lable>
							</div>
							<div class="col-sm-8">
								<textarea rows="5" cols="255" maxlength="45"
									placeholder="Description" name="description">
							</textarea>
								<br />
							</div>
							<div class="col-sm-4">
								<lable>Price : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="number" min="0" name="price" class="addInputs"
									required><br /> <br />
							</div>
							<div class="col-sm-4">
								<lable>In Stock : <span>*</span></lable>
							</div>
							<div class="col-sm-8">
								<input type="number" id="" min="0" name="stock"
									class="addInputs" required><br /> <br />
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="" class="btn btn-info">Save</button>
							<button type="reset" id="clear" class="btn btn-danger">Clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>