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
		<br />
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
								data-toggle="modal" data-target="#editUser">
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
		<!--Edit use modal   -->
		<div class="modal fade" id="editUser" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New User Registration</h4>
				</div>
				<form id="myForm" class="modalview" action="userRegisterInt.jsp" method="post">
					<div class="modal-body">
						<div class="col-sm-2">
							<lable>Name:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<input type="text" id="uName" name="userName" class="addInputs"
								placeholder="Enter name" required><br /> <br />
						</div>
						<div class="col-sm-2">
							<lable>Email:<span>*</span> </lable>
						</div>
						<div class="col-sm-10">
							<input type="text" class="addInputs" id="" name="userEmail"
								placeholder="Enter Email id (abc@xyz.com)" required><br />
							<br />
						</div>
						<div class="col-sm-2">
							<lable>Password:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<input type="password" id="" name="userPassword" class="addInputs"
								placeholder="Enter name" required><br /> <br />
						</div>
						<div class="col-sm-2">
							<lable>Retype Password:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<input type="password" id="" name="userRePassword" class="addInputs"
								placeholder="Enter name" required><br /> <br />
						</div>
						<div class="col-sm-2">
							<lable>Mobile:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<input type="text" class="addInputs" id="" name="userMobile"
								placeholder="Enter mobile number(9XXXXXXXXX)" required><br />
							<br />
						</div>
						<div class="col-sm-2">
							<lable>Date of birth:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<input type="text" class="addInputs" id="" name="userDob"
								placeholder="dd/mm/yyyy" required><br /> <br />
						</div>

						<div class="row">
							<div class="form-group col-sm-2">
								<label>Gender:<span>*</span></label>
							</div>
							<div class="form-group col-sm-1">
								<label class="radio-inline"> <input type="radio"
									value="male" name="userGender" /> <span>Male</span>
								</label>
							</div>
							<div class="form-group col-sm-1">
								<label class="radio-inline"> <input type="radio" checked
									value="female" name="userGender" /> <span>Female</span>
								</label> </label>
							</div>
						</div>
						<div class="col-sm-2">
							<lable>Address:<span>*</span></lable>
						</div>
						<div class="col-sm-10">
							<textarea rows="5" cols="255" maxlength="2000"
								placeholder="Billing Address" name="userAddress">
							</textarea>
							<br />
							<br />
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" id="userReg" class="btn btn-info">Login</button>
						<button type="reset" id="clear" class="btn btn-danger">Clear</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>