<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page import="model.Cart"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PhucStore | PHUC MOBILE</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="css/checkout1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
<%@ include file="header.jsp" %>
<main class="page payment-page">
    <section class="payment-form dark">
      <div class="container">
        <div class="block-heading">
          <h2>Payment</h2>
        </div>
        <form>
         <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>Phuc Store</strong>
                        <br>
                        151 BachDang St,
                        <br>
                        LienChieu, DaNang
                        <br>
                        Phone: (+84) 934-999-999
                    </address>
                </div>
          <div class="container">
          
            <div class="row">
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>#</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
									
									double totalPrice = 0;
									int totalProduct = 0;
									ArrayList<Cart> cart=null;
									if(session.getAttribute("cart")!=null){
										cart = (ArrayList<Cart>) session.getAttribute("cart");
										}
				%>
				<%
     			int i=0;
				for (Cart o : cart) {
     			i=i+1;
     			totalPrice = totalPrice + (o.getProduct().getPrice()*o.getQuantity());
     			totalProduct = totalProduct + o.getQuantity();
     			%>
                        <tr>
                            <td class="col-md-9"><em><%=o.getProduct().getName()%></em></td>
                            <td class="col-md-1" style="text-align: center"> <%=o.getQuantity()%> </td>
                            <td class="col-md-1 text-center"><%=o.getProduct().getPrice()%></td>
                            <td class="col-md-1 text-center"><%=o.getProduct().getPrice()*o.getQuantity()%></td>
                        </tr>
                        <% } %>
                        
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right">
                            <p>
                                <strong>Subtotal: </strong>
                            </p>
                            <p>
                                <strong>Tax: </strong>
                            </p>
                             <p>
                                <strong>Discount: </strong>
                            </p>
                        </td>
                        <td class="text-center">
                            <p>
                                <strong><fmt:setLocale value = "en_US"/><fmt:formatNumber value = "<%=totalPrice%>" type = "currency"/></strong>
                            </p>
                            <p>
                                <strong><fmt:setLocale value = "en_US"/><fmt:formatNumber value = "0" type = "currency"/></strong>
                            </p>
                            <p>
                                <strong><fmt:setLocale value = "en_US"/><fmt:formatNumber value = "0" type = "currency"/></strong>
                            </p>
                        </td>
                        
                        </tr>
                        
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong><fmt:setLocale value = "en_US"/><fmt:formatNumber value = "<%=totalPrice%>" type = "currency"/></strong></h4></td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </div>
          <div class="card-details">
            <h3 class="title">Credit Card Details</h3>
            <div class="row">
              <div class="form-group col-sm-7">
                <label for="card-holder">Card Holder</label>
                <input id="card-holder" type="text" class="form-control" placeholder="Card Holder" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-5">
                <label for="">Expiration Date</label>
                <div class="input-group expiration-date">
                  <input type="text" class="form-control" placeholder="MM" aria-label="MM" aria-describedby="basic-addon1">
                  <span class="date-separator">/</span>
                  <input type="text" class="form-control" placeholder="YY" aria-label="YY" aria-describedby="basic-addon1">
                </div>
              </div>
              <div class="form-group col-sm-8">
                <label for="card-number">Card Number</label>
                <input id="card-number" type="text" class="form-control" placeholder="Card Number" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-4">
                <label for="cvc">CVC</label>
                <input id="cvc" type="text" class="form-control" placeholder="CVC" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-12">
                <button type="button" class="btn btn-primary btn-block">Proceed</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </main>
<div id="formLogin" style="display: none;">
    <%@ include file="LoginServlet.jsp" %>
</div>
<%@ include file="footer.jsp" %>

<script src="./jvs3.js"></script>  
</body>
</html>