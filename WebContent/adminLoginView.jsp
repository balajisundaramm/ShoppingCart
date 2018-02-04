<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
	margin: 5%;
	background-image: url("images/shopping1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}

input {
	width: 100%;
}
</style>
<script type="text/javascript">
	$(window).on('load', function() {
		$('#adminLogin').modal('show');
	});
	$('document').ready(function() {
		$.validate({
			  form : '#adminLogin'
			});
		/* $('#myForm').submit(function(e) {
		    e.preventDefault();
			var name=$('#uname').val();
			var pass=$('#upass').val();
			var valid=true;
			if(!(name.equals(admin)) && (!(pass.equals(admin123)))){
				valid=false
				$('#error').html('Choose different destination')
			}
			else 
		        $('#error').html('');
		}
		if(valid)
		    $('#myForm').submit(); */
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="header">
			<div class="w3-dropdown-hover col-sm-offset-10">
				<button class="w3-button w3-green">Login</button>
				<div class="w3-dropdown-content w3-bar-block w3-border">
					<a href="adminLoginView.ado" class="w3-bar-item w3-button">Admin
						Login</a> <a href="userLoginView.udo" class="w3-bar-item w3-button">User
						Login</a>
				</div>
			</div>
		</div>
		<div class="modal fade" id="adminLogin" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Admin Login</h4>
					</div>
					<form id="myForm" class="modalview" action="adminLoginInt.jsp"
						method="post">
						<div class="modal-body">
							<div class="col-sm-3" id="email-error-dialog">
								<lable>User name : (admin)</lable>
							</div>
							<div class="col-sm-9">
								<input type="text" pattern="^(admin)$" id="uname" name="adminUserName"
									class="addInputs" required
									data-validation="required pattern"
									data-validation-error-msg-required="User name cannot be empty"
									data-validation-error-msg-pattern ="Enter admin" /><br />
								<br />
								<p>${errorMsg }</p>
							</div>
							<div class="col-sm-3" id="email-error-dialog">
								<lable>Password: (admin123)</lable>
							</div>
							<div class="col-sm-9">
								<input type="password" pattern="^(admin123)$" class="addInputs" id="upass"
									name="adminPassword" required
									data-validation="required pattern"
									data-validation-error-msg-required="Password cannot be empty"
									data-validation-error-msg-pattern ="Enter admin123"><br />
								<br />
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" id="adminLogin" class="btn btn-info">Login</button>
							<button type="reset" id="clear" class="btn btn-danger">Clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>