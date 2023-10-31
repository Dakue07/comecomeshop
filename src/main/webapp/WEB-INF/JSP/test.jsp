<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>toppage</title>
</head>
<body>
    <!-- header -->
    <%@include file="../assets/template/header.jsp" %>
    
    <!-- 中身 -->
    
    	<form action="come/test" method="get">
    		<input type="text" name="tesuto">
    		<input type="submit" value="go">
    	</form>
    
    <!-- footer -->
    <%@include file="../assets/template/footer.jsp" %>
</body>
</html>