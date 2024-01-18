<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
れびゅうぺーじ
<c:forEach var="data" items="${data}">
	${data.rice_image_path}<br>${data.rice_name}<br>${data.review_comment}<br>${data.review_star}<br>
</c:forEach>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
