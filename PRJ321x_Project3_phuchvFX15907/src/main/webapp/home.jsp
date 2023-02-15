<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhucStore | PHUC MOBILE</title>
</head>
<body>

<%@ include file="header.jsp" %>
<%@ include file="body.jsp" %>
<div id="formLogin" style="display: none;">
    <%@ include file="LoginServlet.jsp" %>
</div>
<%@ include file="footer.jsp" %>

<script src="./jvs3.js"></script>
</body>
</html>