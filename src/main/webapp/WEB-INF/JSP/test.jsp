<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

<c:forEach var="data" items="${data[2]}">
	${data.card_number}<br>
	${data.card_holdername}<br>
</c:forEach>
<c:forEach var="data" items="${data[0]}">
	${data.rice_name}<br>
</c:forEach>
<c:forEach var="data" items="${data[1]}">
	${data.useraddress_postcode}<br>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
