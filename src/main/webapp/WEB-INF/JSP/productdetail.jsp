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
	<br>${data.review_comment}<br>${data.review_star}<br>${data.user_id}
	
	<!-- user_idが一致したら削除ボタンを表示 -->
	<c:if test="${userBean.user_id eq data.user_id}">
		<form action="<%= request.getContextPath() %>/come/deletereview" method="post">
			<input type="hidden" name="review_id" value="${data.review_id}">
			<input type="hidden" name="rice_id" value="${data.rice_id}">
			<input type="submit" value="削除">
		</form>
	</c:if>
</c:forEach>
<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
