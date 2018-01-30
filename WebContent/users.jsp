<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>
<head>
<title>Users list</title>
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
	$('document')
</script>
</head>
<body>
	<div class="container">
		<!-- include common header for admin portal  -->
		<%@ include file="header.jsp"%>
		<!--Dynamic table for list of users.  -->
		<br/>
		<div>
			<table class="table" id="empTable">
				<tr>
					<th>User Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<jstl:forEach items="${userDetails}" var="userDetails">
					<tr>
						<td><a href="">${userDetails.name}</a></td>
						<td>${userDetails.email}</td>
						<td>${userDetails.mobile}</td>
						<td>
							<button type="button" class="edit btn btn-warning" id=""
								data-toggle="modal" data-target="#AddModal">
								<span class="glyphicon glyphicon-edit"></span>
							</button>
						</td>
						<td><a id=""
							href="deleteUser.ado?userEmail=${userDetails.email}"
							onclick="return confirm('Are you sure you want to delete this user?');"
							class="delete btn btn-warning"> <span
								class="glyphicon glyphicon-trash"></span>
						</a></td>
					</tr>
				</jstl:forEach>
			</table>
		</div>

	</div>
</body>
</html>