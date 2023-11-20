<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
商品一覧ページ
<br>

<c:if test="${not empty data.userBean}">
    ${data.userBean.user_name}<br>
</c:if>

<c:if test="${empty data.userBean}">
	ゆーざーないよ<br>
</c:if>



<c:forEach var="rice" items="${data.riceDto}">
	 ${rice.rice_name} ${rice.rice_id} ${rice.rice_genre} ${rice.rice_weight} ${rice.rice_made} ${rice.rice_image_path} ${rice.rice_since} ${rice.rice_stock} ${rice.rice_price}<br>
</c:forEach>

あいうえお

<!--  <%@include file="../../assets/template/slideshow.jsp" %> -->


	<!-- いじるな -->
	<%@include file="../../assets/template/footer.jsp" %>