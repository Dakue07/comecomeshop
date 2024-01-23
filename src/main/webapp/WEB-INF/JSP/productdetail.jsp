<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
productdetail
<c:forEach var="data" items="${data[0]}">
	<br><img src="${data.rice_image_path}" alt="${data.rice_name}"><br>${data.rice_name}<br>${data.rice_price}
</c:forEach>

<c:forEach var="data" items="${data[1]}">
	<br>${data.review_comment}<br>${data.review_star}<br>
</c:forEach>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
