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
<div class="wrapper">
    <header class="header">
        <div>
            <a href="Controller?page=index" style="font-size: 25px">Tech</a>
            <c:if test="${session != null}">
                <a href="Admin?page=index">Home</a>
            </c:if>
        </div>
        <div>
            <c:if test="${session != null}">
                <form method="post" action="Admin">
                    <input type="hidden" name="page" value="admin-search">
                    <div style="display: flex; align-items: center">
                        <input style="padding: 4% 3%;" type="text" name="searchName" value="<c:out value="${searchName}"></c:out>">
                        <button style="margin-left: 2%">Search</button>
                    </div>
                </form>
            </c:if>
        </div>
        <div>
            <c:if test="${session != null}">
                <a href="Admin?page=logout">Logout</a>
                <a href="Admin?page=add-product">New product</a>
            </c:if>
        </div>
    </header>

    <main class="main">
        <form class="form" method="post" action="Admin">
            <h1 class="form_title">LOG IN</h1>
            <input type="hidden" name="page" value="admin-login-form">
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