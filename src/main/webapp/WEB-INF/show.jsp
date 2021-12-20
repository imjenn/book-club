<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Read Share</title>
	<link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/css/show.css">
</head>
<body>
	<div id="container">
		<nav>
			<h1><c:out value="${book.title}"></c:out></h1>
			<a href="/books">back to the shelves</a>
		</nav>
		<div>
			<p>
				<span class="username"><c:out value="${book.user.userName}"></c:out></span> 
				read 
				<span class="book-title"><c:out value="${book.title}"></c:out></span> 
				by 
				<span class="author"><c:out value="${book.author}"></c:out></span>
			</p>
			<blockquote style="font-style:italic">
				<c:out value="${book.thoughts}"></c:out>
			</blockquote>
		</div>
	</div>
</body>
</html>