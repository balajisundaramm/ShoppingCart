<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
</head>
<body>
<jsp:useBean id="adminLogin" class="com.spaneos.shoppingcart.AdminLoginBean" scope="request">
<jsp:setProperty property="*" name="adminLogin"/>
</jsp:useBean>
<jsp:forward page="login.ado"/>
</body>
</html>