<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PhucStore | PHUC MOBILE</title>
<link rel="stylesheet" href="css/style6.css">
<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
</head>
<body>

<%@ include file="header.jsp" %>
    <div class="mainbody">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-sm-12 leftcolumn">
                    <div class="container">
                    
                        <div class="row">
                        	
                        	
                            <div class="col-lg-4 item-photo">
                            
                            
                                <div> <a href="#"><img style="max-width:100%;" src="${inforproduct.src}"></a></div>
                                
                            </div>
                            <div class="col-lg-8" style="border:0px solid gray">
                                <!-- Datos del vendedor y titulo del producto -->
                                <h3>${inforproduct.name}</h3>    

                                <!-- Precios -->
                                <h6 class="title-price"><small>PRICE</small></h6>
                                <h3 style="color:red; margin-top:0px;">${inforproduct.price}$</h3>

                                <div class="section" style="padding-bottom:5px;">
                                    <h6 class="title-attr"><small>Description</small></h6>                    
                                    <div>
                                    <div class="attr2">${inforproduct.description}</div>
                                    </div>
                                </div>   
                        <!-- Botones de compra -->
                                <div class="section" style="padding-bottom:20px;">
                                    <button class="btn btn-success" onclick="window.location.href='cart?action=addcart&id=${inforproduct.id}'"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Add to cart</button>                  
                                </div>                                        
                            </div>  
                                                        
                        </div>
                        
                        
                    </div>
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
  
  <div id="formLogin" style="display: none;">
    <%@ include file="LoginServlet.jsp" %>
</div>
<%@ include file="footer.jsp" %>

<script src="./jvs3.js"></script>  
</body>
</html>