<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/post.css">

<!-- ここから下に書いてね -->

<title>住所の変更</title>


<h2><strong>住所一覧</strong></h2>

<c:if test="${empty data}">
    <h1>住所が登録されていません</h1>
</c:if>

<form action="<%= request.getContextPath() %>/createpost" method="post">
	<input type="hidden" name="url" value="/createpost">
	<section>
	  <br><button class="btn_06-2" id="addPaymentBtn"><span>住所の追加</span></a><br>
	</section>
</form>

<c:if test="${not empty data}">
    <div class="address-container">
        <c:forEach var="data" items="${data}">
            <div class="address-item">
                <b>郵便番号：</b>${data.useraddress_postcode}<br>
                <b>都道府県：</b>${data.useraddress_state_city}<br>
                <b>市町村・番地(部屋番号・建物名)：</b>${data.useraddress_street}<br>
                <b>受取人：</b>${data.useraddress_receiver}<br>
                <form action="<%= request.getContextPath() %>/come/deletepost" method="post">
                    <input type="hidden" name="useraddress_id" value="${data.useraddress_id}">
                    <button type="submit" class="btn btn-outline-danger">この住所を削除する</button>
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>



<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp" %>
