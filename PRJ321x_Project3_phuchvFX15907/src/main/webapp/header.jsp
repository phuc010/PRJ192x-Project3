<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhucStore | PHUC MOBILE</title>
    <link rel="stylesheet" href="css/style6.css">
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
</head>
<body>
	<div class="header">
        <h1>Phuc Store</h1>
        <div class="logo"><a href="./home"><img src="./img/logo.png" alt="logo"> </a></div>
    </div>
    <div class="topnav" id="myTopnav">
        <ul>
            <li><a href="./home">Home</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#bottom">About us</a></li>
            <c:if test="${sessionScope.account == null}">
	            <li><a href="./register">Register</a></li>
	            <li><a id="openLoginPage"  href="#">Login</a></li>
            </c:if>
            <c:if test="${sessionScope.account != null}">
            	<li><a href="#">Wellcome ${sessionScope.account.usr}</a></li>
            		<c:if test="${sessionScope.account.checkIsAdmin == 1}">
	            	<li><a href="./admin">Admin Page</a></li>
	          		 </c:if>
            	<li><a href="logout">Logout</a></li>
          	 </c:if>
        </ul>
        <div class="search-container">
            <form action="search" method="post">
                <input value="${txtSearchName}" name="txtsearch" type="text" class="search-input" placeholder="Search..." >
                <button type="submit" class="search-button"><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>
<script src="./jvs3.js"></script>
</body>
</html>