<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Error</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="css/mousehover.css">
<style>
body {
	margin: 5%;
	background-image: url("images/shopping1.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
}
</style>
<script>
$(window).on('load', function() {
	$('#adminLogin').modal('show');
});
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="header">
			<div class="dropdown col-sm-offset-10">
				<button class="dropbtn">Login</button>
				<div class="dropdown-content">
					<a href="adminLoginView.ado">Admin Login</a> 
					<a href="userLoginView.udo">User Login</a> 
				</div>
			</div>
			<div class="modal fade" id="adminLogin" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Error</h4>
					</div>
					
					<h4>Login First!!!</h4>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>