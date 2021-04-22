<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tech.com</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="cart.css">
</head>
<c:if test="${session != null}">
	<body>
	<div class="wrapper">
		<header class="header">
			<div>
				<a href="Controller?page=index" style="font-size: 25px">Tech</a>
				<a href="Admin?page=index">Home</a>
			</div>
			<div>
				<form method="post" action="Admin">
					<input type="hidden" name="page" value="admin-search">
					<div style="display: flex; align-items: center">
						<input style="padding: 4% 3%;" type="text" name="searchName" value="<c:out value="${searchName}"></c:out>">
						<button style="margin-left: 2%">Search</button>
					</div>
				</form>
			</div>
			<div>
				<a href="Admin?page=logout">Logout</a>
				<a href="Admin?page=add-product">New product</a>
			</div>
		</header>

		<main class="main">
			<div style="margin-bottom: 3%; margin-top: 3%">
				<table>
					<tr>
						<th>Name</th>
						<th>Image</th>
						<th>Price</th>
						<th>Category</th>
						<th>Edit</th>
						<th>Remove</th>
					</tr>
					<c:forEach items="${productList}" var="product">
						<tr>
							<td><c:out value="${product.getName()}"/></td>
							<td><img src="${product.getImage()}"></td>
							<td><c:out value="${product.getPrice()}"/> byn</td>
							<td><c:out value="${product.getCategory()}"/></td>
							<td><a href="Admin?page=edit-product&id=<c:out value="${product.getProductId()}"/>">Edit</a></td>
							<td><a href="Admin?page=delete&id=<c:out value="${product.getProductId()}"/>">X</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</main>

		<footer class="footer">
			<div>
				<label>&copy; 2021 Copyright:</label>
				<a href="#">Tech.com</a>
			</div>
		</footer>
	</div>
	</body>
</c:if>
</html>