<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/styleAddmin.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css?fbclid=IwAR1YsW4Cd3uJltNc6k1kJ8R9VzNjmSXk9rjmW32BPoA6LWxNrZBCUY-D4i8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div id="menu">
        <div class="logo">
            <img src="img/logo.png" alt="logo">
            <h1>PhucStore Admin</h1>
        </div>
        <div class="item">
            <ul>
           	 	<li><i class="fas fa-home-lg"></i><a href="./home">PhucStore Page</a></li>
                <li><i class="fas fa-chart-pie-alt"></i><a href="#">Dashboard</a></li>
                <li><i class="fas fa-clipboard-user"></i><a href="#">Staff Manager</a></li>
                <li><i class="fal fa-book"></i><a href="#">Product Manager</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div id="idmenu-btn" class="menu-btn">
            <a href="#"><i class="fas fa-bars"></i></a>
        </div>
        <form class="logout" action="logout" method="get">
        
        	<button type="submit" >LogOut <i class="fas fa-sign-out"></i></button>

        
        </form>
        
        <%
        	if(session.getAttribute("userID") != null){
        		%>
        		<p>Welcome Username:  <%=session.getAttribute("userID") %></p>
        	<% } %>
    </div>

<script src="admin/jsAddmin.js"></script>
</body>
</html>