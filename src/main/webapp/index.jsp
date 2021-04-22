<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Tech.com</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="product.css">
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
        <ul class="menu">
            <li><a href="Controller?page=index">All products</a></li>
            <li><a href="Controller?page=laptops">Laptops</a></li>
            <li><a href="Controller?page=smartphones">Smartphones</a></li>
        </ul>
        <div class="list">
            <c:forEach items="${productList}" var="product">
                <div class="item">
                    <div><c:out value="${product.getName()}"></c:out></div>
                    <div><img src="${product.getImage()}"></div>
                    <div>Price: <c:out value="${product.getPrice()}"/> byn</div>
                    <div><a href="Controller?page=add-to-cart&action=index&id=<c:out value="${product.getProductId()}"/>">
                        <button>Add to Cart</button></a></div>
                </div>
            </c:forEach>
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
</html>