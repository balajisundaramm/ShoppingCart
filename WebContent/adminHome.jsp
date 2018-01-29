<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>  <!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
		<div class="row" id="header">
			<div class="col-sm-offset-2">
				<button class="btn btn-info" onclick="adminHome.jsp">e-Cart</button>
				<div class="w3-dropdown-hover">
					<button class="btn btn-info">Categories</button>
					<div class="w3-dropdown-content w3-bar-block w3-border">
						<jstl:forEach items="${category}" var="categoryName">
							<a href="category_${categoryName}.ado">${categoryName}</a><br/>
						</jstl:forEach>
						<a href="#addCategory" data-toggle="modal"
							data-target="#addCategory">Add New</a>
					</div>
				</div>
				<button class="btn btn-info">Users</button>
				<button class="btn btn-info">Logout</button>
			</div>
		</div>

		<!-- Login modal  -->
		<div class="modal fade" id="addCategory" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Category</h4>
					</div>
					<form id="addCategory" class="modalview"
						action="addCategoryInt.jsp" method="post">
						<div class="modal-body">
							<div class="col-sm-3">
								<lable>Catagory Name : <span>*</span></lable>
							</div>
							<div class="col-sm-9">
								<input type="text" id="uname" name="categoryName"
									class="addInputs" placeholder="Enter admin" required><br />
								<br />
							</div>
							<div class="col-sm-3">
								<lable>Description:<span>*</span> </lable>
							</div>
							<div class="col-sm-9">
								<textarea rows="5" cols="255" maxlength="50"
									placeholder="Description" name="categoryDescription">
							</textarea>
							</div>
						</div>

						<div class="modal-footer">
							<button type="submit" id="" class="btn btn-info">Add
								Category</button>
							<button type="reset" id="clear" class="btn btn-danger">Clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>