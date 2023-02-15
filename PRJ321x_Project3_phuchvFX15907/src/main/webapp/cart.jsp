<%@page import="controller.AddToCartController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="model.Cart"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhucStore | PHUC MOBILE</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container my-3">
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Ordinal number</th>
					<th scope="col">Name</th>
					<th scope="col">Product type</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					<th scope="col">Amount</th>
					<th scope="col">Cancel</th>
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
					<td><%=i%></td>
					<td><%=o.getProduct().getName()%></td>
					<td><%=o.getProduct().getType()%></td>
					<td><%=o.getProduct().getPrice()%></td>
					<td>
							<form action="" method="post" class="form-inline">
						<input type="hidden" name="id" value="1" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href="cart?action=dec&id=<%=o.getProduct().getId()%>"><i class="fas fa-minus-square"></i></a>
								<input type="text" name="quantity" class="form-control"  value="<%=o.getQuantity()%>" readonly> 
								<a class="btn bnt-sm btn-incre" href="cart?action=inc&id=<%=o.getProduct().getId()%>"><i class="fas fa-plus-square"></i></a> 
							</div>
						</form>
					</td>
					<td> <%=o.getProduct().getPrice()*o.getQuantity()%> </td>
					<td><a href="cart?action=removecart&id=<%=o.getProduct().getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
					
				</tr>
				<% } %>
			</tbody>
			
		</table>
	<div class="d-flex py-3"><h3>Total Price: <fmt:setLocale value = "en_US"/><fmt:formatNumber value = "<%=totalPrice%>" type = "currency"/></h3>
	<a class="mx-3 btn btn-primary" href="checkout.jsp">Check Out</a>
	<c:if test="${sessionScope.account != null}">
	<a class="mx-3 btn btn-success" href="checkout.jsp">Save this cart</a>
	</c:if>
	</div>
	<div class="d-flex py-3"><h5>Products in cart: <%=totalProduct%> </h5></div>
	</div>
<div id="formLogin" style="display: none;">
    <%@ include file="LoginServlet.jsp" %>
</div>

</body>
</html>