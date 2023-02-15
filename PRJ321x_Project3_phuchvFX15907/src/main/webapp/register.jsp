<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhucStore | PHUC MOBILE</title>
<link rel="stylesheet" href="css/register1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%
     	String unavailable = (String) session.getAttribute("unavailable");
	 %>

<div class="main">

      <form action="register" method="post" class="form" id="form-1">
        <h3 class="heading">Sign Up</h3>
			<%
        	if(session.getAttribute("unavailable") != null){
        		%>
        		<h3 style="color:red;"><%=unavailable%></h3>
        	<% } %>
        <div class="spacer"></div>

        <div class="form-group">
          <label for="fullname" class="form-label">Name(*)</label>
          <input value="${atbNameU}" id="fullname" name="yourName" type="text" placeholder="Ex: Ho Phuc" class="form-control" />
          <span class="form-message"></span>
        </div>

        <div class="form-group">
          <label for="email" class="form-label">Email(*)</label>
          <input value="${atbYourEmail}" id="email" name="yourEmail" type="text" placeholder="Ex: email@domain.com" class="form-control">
          <span class="form-message"></span>
        </div>
		
		<div class="form-group">
          <label for="address" class="form-label">Address</label>
          <input value="${atbYourAdd}" id="address" name="yourAdd" type="text" placeholder="Ex: Dai hoc FPT" class="form-control">
          <span class="form-message"></span>
        </div>
        
        <div class="form-group">
          <label for="phone" class="form-label">Phone</label>
          <input value="${atbYourPhone}" id="phone" name="yourPhone" type="text" placeholder="Ex: 0987654321" class="form-control">
          <span class="form-message"></span>
        </div>
        
        <div class="form-group">
          <label for="password" class="form-label">Password(*)</label>
          <input value="${atbYourPass}" id="password" name="yourPass" type="password" placeholder="Your password" class="form-control">
          <span class="form-message"></span>
        </div>

        <div class="form-group">
          <label for="password_confirmation" class="form-label">Repeat Password(*)</label>
          <input id="password_confirmation" name="yourRepass" placeholder="Repeat your password" type="password" class="form-control">
          <span class="form-message"></span>
        </div>
        <div>
        <p>Have already an account? <a href="./login"
                    class="fw-bold text-body">Login here</a>  <a href="./home" class="fw-bold text-body">Home</a> </p> 

        <button type="submit" class="form-submit">Register</button>
        </div>
         
        	
      </form>

 </div>
    
    <script>

      document.addEventListener('DOMContentLoaded', function () {
        // Mong muốn của chúng ta
        Validator({
          form: '#form-1',
          formGroupSelector: '.form-group',
          errorSelector: '.form-message',
          rules: [
            Validator.isRequired('#fullname', 'Please enter your name'),
            Validator.isEmail('#email'),
            Validator.minLength('#password', 3),
            Validator.isRequired('#password_confirmation'),
            Validator.isConfirmed('#password_confirmation', function () {
              return document.querySelector('#form-1 #password').value;
            }, 'Repeat your password is not correct ')
          ],
        });
        Validator({
          form: '#form-2',
          formGroupSelector: '.form-group',
          errorSelector: '.form-message',
          rules: [
            Validator.isEmail('#email'),
            Validator.minLength('#password', 3),
          ],
          onSubmit: function (data) {
            // Call API
            console.log(data);
          }
        });
      });

    </script>

    <script src="./register.js"></script>
</body>
</html>