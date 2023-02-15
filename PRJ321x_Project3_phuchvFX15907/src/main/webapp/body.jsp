<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhucStore | PHUC MOBILE</title>
    <link rel="stylesheet" href="css/style6.css">
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.15.4/css/all.css?fbclid=IwAR1YsW4Cd3uJltNc6k1kJ8R9VzNjmSXk9rjmW32BPoA6LWxNrZBCUY-D4i8">
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
   
    </script>
</head>
<body>
	<%
     	String empty = (String) session.getAttribute("empty");
	 %>
	 
<div class="mainbody">
        <div class="container-fluid">
        <div class="row">
            <div class="col-lg-9 col-md-8 col-sm-12 leftcolumn">
		        <section class="text-center ">
		        <!--Grid row-->
		        <div class="row wow fadeIn">
			
			<%
        	if(session.getAttribute("empty") != null){
        		%>
        		<h3><%=empty%></h3>
        	<% } %>
        	
        	
        	
					<c:forEach items="${listProduct}" var="o">
		          <!--Grid column-->
		          <div class="col-lg-4 col-md-6 ">
		            <!--Card-->
		            <div class="card">
		              <!--Card image-->
		              <div class="view overlay">
		              <a href="inforproduct?pid=${o.id}">
		                <img src= "${o.src}" class="card-img-top" alt="">
		                </a>
		                <div class="mask rgba-white-slight"></div>
		                
		              </div>
		              <!--Card image-->
		              <!--Card content-->
		              <div class="card-body text-left">
		                <!--Category & Title-->
		                <h6 class="grey-text">
		                  ${o.type}
		                </h6>
		                <h5>
		                  <strong>
		                    <a href="inforproduct?pid=${o.id}" class="dark-grey-text">${o.name}
		                    </a>
		                  </strong>
		                </h5>
		                <h4 class="font-weight-bold blue-text">
		                  <strong>${o.price}$</strong>
		                </h4>
		              </div>
		              <form action="cart?action=addcart&id=${o.id}" method="post" >
		              <button class="btn btn-success" type="submit"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to cart</button>
		             </form>
		            <!--Card content-->
		            </div>
		            <!--Card-->
		            </div>
		            
		            </c:forEach>
		          </div>                  
		          </section>
            	
            	
            </div>
            <div class="col-lg-3 col-md-4 rightcolumn">
            		 <form action="cart?action=buynow" method="post">
            		<div class="card">
                     <h2>Shopping cart</h2>
                      <button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>BUY NOW <i class="fas fa-shopping-cart"></i></button>
                     </div>
                     </form>
                     
                <div class="card">
                    <h3>Popular products or banner</h3>
                    <div class="fakeimg"><p>Image</p></div>
                    <div class="fakeimg"><p>Image</p></div>
                    <div class="fakeimg"><p>Image</p></div>
                </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>