<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
購入手続き



<c:forEach var="data" items="${data}">
	${data.card_holdername}<br>
	${data.card_number}<br>
	${data.card_validity}<br>
	${data.card_securitycode}<br>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
