<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit User</title>
</head>
<body>
<jsp:useBean id="editUser" class="com.spaneos.shoppingcart.UserRegistrationBean" scope="request">
<jsp:setProperty property="*" name="editUser"/>
</jsp:useBean>
<jsp:forward page="updateUserDB.ado"/>
</body>
</html>