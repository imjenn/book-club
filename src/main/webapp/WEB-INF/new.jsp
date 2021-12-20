<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add a New Book</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/new.css">
</head>
<body>
	<div id="container">
		<h1>Add a Book to Your Shelf!</h1>
		<form:form action="/books/new" method="post" modelAttribute="book">
   	 		<p>
        		<form:label path="title">Title: </form:label>
        		<form:errors style="color:red" path="title"/>
        		<form:input class="form-control" type="text" name="title" path="title"/>
    		</p>
    		<p>
        		<form:label path="author">Author: </form:label>
        		<form:errors style="color:red" path="author"/>
        		<form:input class="form-control" type="text" name="author" path="author"/>
    		</p>
    		<p>
        		<form:label path="thoughts">My thoughts: </form:label>
        		<form:errors style="color:red" path="thoughts"/>
        		<form:textarea class="form-control" type="text" name="thoughts" path="thoughts"/>
    		</p>
   			<p>
   				<form:input type="hidden" value="${user_id}" path="user" />
   			</p>
		    <input type="submit" class="btn btn-primary" value="Submit"/>
		</form:form>
	</div>
</body>
</html>