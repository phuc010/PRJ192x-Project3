<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
</head>
<body>
	
	 <%
     	String error = (String) session.getAttribute("error");
	 %>


<div id="login-box">
        <div id="login-content">
            <div id="form-login">
            <form action="login" method="post">
                <div class="close-login">
                    <div id="close">&times;</div>
                </div>
                <div class="acclogin">
                    <img src="./img/acclogin.png" alt="acclogin">
                </div>
                
	                <div class="useandpass">
	                
	                <%
        	if(session.getAttribute("error") != null){
        		%>
        		<h3><%=error%></h3>
        		
        	<% } %>
        	<%
        	Cookie[] cookies = request.getCookies();
		 	String name = "";
		 	String pass = "";
		 	for (Cookie c : cookies){
		 		if (c.getName().equals("username")){
		 			name = c.getValue();
		 			request.setAttribute("username1", name);
		 		}
		 		if (c.getName().equals("password")){
		 			pass = c.getValue();
		 			request.setAttribute("password1", pass);
		 		}
		 	}
        	%>
	                    <p>Username:</p>
	                    <div class="form-row">
	                        <input id="username" class="form-input" type="text" name="username" placeholder="Enter Username" value="${username1}">
	                    </div>
	                    <p>Password: </p>
	                    <div class="form-row">
	                        <input id="password" class="form-input" type="password" name="password" placeholder="Enter Password" value="${password1}">
	                    </div>
	                </div>
	                <div class="bnt-login">
	                    <button id="btnLogin">Login</button>
	                </div>
                
                <div class="rememberme">
                    <input type="checkbox" name="remember" value="true">
                    <label> Remember me</label>
                </div>
                
              </form>
                <div class="footer-login">
                    <div class="cancel">
                        <button id="bntCancel" onclick="location.href='./home';" class="close">Cancel</button>
                    </div>
                    <div class="forgotpass">
                        <p>Forgot <a href="#">password?</a></p>
                    </div>
                </div>
                
                

            </div>
        </div>
    </div>
   
<script src="./jvs3.js"></script>
</body>
</html>