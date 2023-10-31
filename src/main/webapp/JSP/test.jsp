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
    
    	<p><a href="<%=request.getContextPath() %>/come/test">てすと</a></p>
    
    <!-- footer -->
    <%@include file="../assets/template/footer.jsp" %>
</body>
</html>