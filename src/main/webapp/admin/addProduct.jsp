<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tech.com</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="auth.css">
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
			<form class="form" method="post" action="Admin">
				<h1 class="form_title">NEW PRODUCT</h1>
				<input type="hidden" name="page" value="add_product">
				<div class="form_group">
					<font color="red"><c:out value="${msg}"></c:out></font>
				</div>
				<div class="form_group">
					<label class="form_label">Name</label>
					<input class="form_input" type="text" name="name" value="<c:out value="${name}"></c:out>" required>
				</div>
				<div class="form_group">
					<label class="form_label">Price</label>
					<input class="form_input" type="text" name="price" value="<c:out value="${price}"></c:out>" required>
				</div>
				<div class="form_group">
					<label class="form_label">Category</label>
					<input class="form_input" type="text" name="category" value="<c:out value="${category}"></c:out>" required>
				</div>
				<div class="form_group">
					<label class="form_label">Image</label>
					<input class="form_input" type="text" name="image" value="<c:out value="${image}"></c:out>" required>
				</div>
				<div class="form_group">
					<button>Add</button>
				</div>
			</form>
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