<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
カート
<c:forEach var="data" items="${data}">
	${data.rice_name}
</c:forEach>


<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
