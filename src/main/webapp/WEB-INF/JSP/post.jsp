<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

<c:if test="${empty data}">
	<h1>住所が登録されていません</h1>
	<a href="<%= request.getContextPath() %>/createpost">新しく住所を登録する</a>
</c:if>



<c:if test="${not empty data}">
	<a href="<%= request.getContextPath() %>/createpost">新しく住所を登録する</a><br>
	<c:forEach var="data" items="${data}"> 
		${data.useraddress_receiver}<br>
		${data.useraddress_postcode}<br>
		${data.useraddress_state_city}<br>
		${data.useraddress_street}<br>
		<form action = "<%= request.getContextPath() %>/come/deletepost" method = post>
			<input type="hidden" name="user_id" value="${data.user_id}">
			<input type="hidden" name="useraddress_receiver" value="${data.useraddress_receiver}">
			<input type="hidden" name="useraddress_postcode" value="${data.useraddress_postcode}">
			<input type="hidden" name="useraddress_state_city" value="${data.useraddress_state_city}">
			<input type="hidden" name="useraddress_street" value="${data.useraddress_street}">
			<input type="submit" value="この住所を削除する">
		</form>
		
	</c:forEach>
</c:if>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
