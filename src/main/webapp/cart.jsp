<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cart</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="cart.css">
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
        <div style="margin-bottom: 3%; margin-top: 3%">
            <table>
                <tr>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Amount</th>
                    <th>Full price</th>
                    <th>Remove</th>
                </tr>
                <c:set var="total" value="0"></c:set>
                <c:forEach items="${cartList}" var="item">
                    <c:forEach items="${productList}" var="product">
                        <c:if test="${item.getItemId() == product.getProductId()}">
                            <c:set var="total" value="${total + product.getPrice() * item.getAmount()}"></c:set>
                            <tr>
                                <td><c:out value="${product.getName()}"/></td>
                                <td><img src="${product.getImage()}"></td>
                                <td><c:out value="${product.getPrice()}"/> byn</td>
                                <td><c:out value="${product.getCategory()}"/></td>
                                <td><c:out value="${item.getAmount()}"></c:out></td>
                                <td><c:out value="${product.getPrice() * item.getAmount()}"/> byn</td>
                                <td><a href="Controller?page=remove&id=<c:out value="${product.getProductId()}"/>">X</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </table>
            <div class="info">
                <div><h3>Order Total: <c:out value="${total}"></c:out> byn</h3></div>
                <c:if test="${session == null}">
                    <div><h3>Please, <a href="Controller?page=login">log in</a> to buy products</h3></div>
                </c:if>
                <c:choose>
                    <c:when test="${x == 0 && session != null}">
                        <div><h3>No items to buy</h3></div>
                    </c:when>
                    <c:when test="${x != 0 && session != null}">
                        <div><a href="Controller?page=success"><button>Buy</button></a></div>
                    </c:when>
                </c:choose>
                <div><a href="Controller?page=index"><button>Continue Shopping</button></a></div>
            </div>
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