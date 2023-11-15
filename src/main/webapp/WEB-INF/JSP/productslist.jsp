<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="data" items="${data}">
	{data.rice_name}
</c:forEach>

あいうえお
<%@include file="../../assets/template/slideshow.jsp" %>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>

