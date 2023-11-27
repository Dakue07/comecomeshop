<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
カート
<c:forEach var="data" items="${data}">
	<br>${data.rice_name}<br>${data.rice_genre}<br>${data.rice_made}<br>${data.rice_weight}<br>${data.cart_quantity}${data.rice_image_path}<br>
	${data.rice_since}<br>${data.rice_stock}<br>${data.rice_price}<br>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
