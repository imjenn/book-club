<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
	<link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<div id="container">
		<div class="nav">
			<div class="nav-1">
				<h1>Welcome, <c:out value="${userName}"></c:out>!</h1>
				<a href="/logout">Logout</a> 
			</div>
			<div class="nav-1">
				<p>Books from everyone's shelves: </p>
				<a href="/books/new">+ Add a book to my shelf!</a>
			</div>
		</div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Title</th>
					<th scope="col">Author Name</th>
					<th scope="col">Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
				<tr>
					<td><c:out value="${book.id}"></c:out></td>
					<td><a href="/books/${book.id}"><c:out value="${book.title}"></c:out></a></td>
					<td><c:out value="${book.author}"></c:out></td>
					<td><c:out value="${book.user.userName}"></c:out></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>