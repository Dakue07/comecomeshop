<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
購入手続き

<a href="<%=request.getContextPath() %>/come/cardInsert" class="btn btn-primary">カード情報の登録</a>

<c:forEach var="data" items="${data}">
	カード名義:${data.card_holdername}<br>
	カード番号:${data.card_number}<br>
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
