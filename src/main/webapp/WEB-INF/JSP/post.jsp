<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->




<c:forEach var="data" items="${data}"> 
	${data.user_id}<br>
	${data.useraddress_receiver}<br>
	${data.useraddress_postcode}<br>
	${data.useraddress_state_city}<br>
	${data.useraddress_street}<br>
	<a href="<%= request.getContextPath() %>/come/deletepost">この住所を削除する</a>
</c:forEach>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
