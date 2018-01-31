<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

span {
	color: red;
}
</style>
<script>
$('#userLoginForm')[0].reset();

</script>
</head>
<body>
	<div class="container">
		<div class="row" id="header">
			<div class="col-xs-4">
				<button class="btn btn-info" onclick="location.href='home.html';">Admin Login</button>
			</div>
			<div class="col-xs-6 text-right">
				<button class="btn btn-info" data-toggle="modal"
					data-target="#userRegistration">Sign up</button>
			</div>
			<div>
				<button class="btn btn-info" data-toggle="modal"
					data-target="#userLogin">Login</button>
			</div>
		</div>
	</div>

	<!--SignUp modal  -->
	<div class="modal fade" id="userRegistration" role="dialog">
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

	<!-- Login modal  -->
	<div class="modal fade" id="userLogin" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">User Login</h4>
				</div>
				<form id="userLoginForm" class="modalview" action="userLoginInt.jsp" 
					method="post">
					<div class="modal-body">
						<div class="col-sm-3">
							<lable>User name:<span>*</span></lable>
						</div>
						<div class="col-sm-9">
							<input type="text" id="uname" name="userId" class="addInputs"
								placeholder="Enter email" required><br /> <br />
						</div>
						<div class="col-sm-3">
							<lable>Password:<span>*</span> </lable>
						</div>
						<div class="col-sm-9">
							<input type="password" class="addInputs" id="userPass"
								name="userPass" placeholder="Enter password" required><br />
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
</body>
</html>