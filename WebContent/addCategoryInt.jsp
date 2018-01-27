<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Category</title>
</head>
<body>
<jsp:useBean id="category" class="com.spaneos.shoppingcart.CategoryBean" scope="request">
<jsp:setProperty property="*" name="category"/>
</jsp:useBean>
<jsp:forward page="categorySuccess.ado"/>
</body>
</html>