<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="auth.css">
</head>

<body>
<c:set var="x" value="0"></c:set>
<c:forEach items="${cartList}" var="i">
    <c:set var="x" value="${x+1}"></c:set>
</c:forEach>

<div class="wrapper">
    <header class="header">
        <div>
            <label>Tech</label>
            <a href="Controller?page=index">Home</a>
        </div>
        <div>
            <form method="post" action="Controller">
                <input type="hidden" name="page" value="search">
                <div style="display: flex; align-items: center">
                    <input style="padding: 4% 3%;" type="text" name="searchName" value="<c:out value="${searchName}"></c:out>">
                    <button style="margin-left: 2%">Search</button>
                </div>
            </form>
        </div>
        <div>
            <c:choose>
                <c:when test="${session == null}">
                    <a href="Controller?page=login">Login</a>
                    <a href="Controller?page=signup">Signup</a>
                </c:when>
                <c:when test="${session != null}">
                    <a href="Controller?page=logout">Logout</a>
                </c:when>
            </c:choose>
            <a href="Controller?page=show-cart">Cart(<c:out value="${x}"/>)</a>
        </div>
    </header>

    <main class="main">
        <form class="form" method="post" action="Controller">
            <h1 class="form_title">LOG IN</h1>
            <input type="hidden" name="page" value="login-form">
            <div class="form_group">
                <font color="red"><c:out value="${msg}"></c:out></font>
            </div>
            <div class="form_group">
                <label class="form_label">Email</label>
                <input class="form_input" type="text" name="email" value="<c:out value="${email}"></c:out>" required>
            </div>
            <div class="form_group">
                <label class="form_label">Password</label>
                <input class="form_input" type="password" name="password" required>
            </div>
            <div class="form_group">
                <button>Log in</button>
            </div>
            <p>
                <label class="form_label">Not a member?</label> <a href="Controller?page=signup">Sign up now</a>
            </p>
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
</html>