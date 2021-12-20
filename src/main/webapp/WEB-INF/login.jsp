<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login and Registration</title>
	<link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
    <div id="container">
    	<form:form class="form" action="/register" method="post" modelAttribute="newUser">
	        <h2>Register</h2>
	        <div class="form-group">
	            <label>User Name:</label>
	            <form:input path="userName" class="form-control" />
	            <form:errors path="userName" style="color: red;" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <form:errors path="email" style="color: red;" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <form:errors path="password" style="color: red;" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Confirm Password:</label>
	            <form:password path="confirm" class="form-control" />
	            <form:errors path="confirm" style="color: red;" class="text-danger" />
	        </div>
	        <input type="submit" value="Register" class="btn btn-primary" />
	    </form:form>
	    
	    <form:form class="form" action="/login" method="post" modelAttribute="newLogin">
	        <h2>Login</h2>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <form:errors path="email" style="color: red;" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <form:errors path="password" style="color: red;" class="text-danger" />
	        </div>
	        <input type="submit" value="Login" class="btn btn-success" />
	    </form:form>
    </div>
    
</body>
</html>

