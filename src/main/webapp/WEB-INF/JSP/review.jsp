<HTML>
<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="CSS/style.css">



<!-- ここから下に書いてね -->
<a href="<%=request.getContextPath() %>/come/adminproduct"">商品一覧へ戻る</a><br>

<c:forEach var="data" items="${data}">
	${data.user_name}${data.review_comment}${data.review_star}<br>
	<form action = "<%= request.getContextPath() %>/come/admindeletereview" method = post>
	    <button class="btn btn-primary">コメントを削除する</button>
	    <input type="hidden" name="review_id" value="${data.review_id}">
	    <input type="hidden" name="rice_id" value="${data.rice_id}">
	</form>
</c:forEach>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
