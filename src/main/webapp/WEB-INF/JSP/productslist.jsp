<!-- いじるな -->
<HTML><%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!DOCTYPE html>


<%@include file="../../assets/template/header2.jsp" %>


<!-- ここから下に書いてね -->
商品一覧ページ
<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
			crossorigin="anonymous"></script>

<c:if test="${not empty data.userBean}">
	${data.userBean.getUser_name()}<br>
</c:if>

<c:if test="${empty data.userBean}">
	ゆーざーないよ<br>
</c:if>





<%@include file="../../assets/template/slideshow.jsp" %>


<div class="row justify-content-center">
  <c:forEach var="rice" items="${data.riceDto}">
    <div class="col-md-auto mb-3 d-flex justify-content-center">
      <div class="card" style="width: 12rem;">
        <img src="${rice.rice_image_path}" class="card-img-top" alt="${rice.rice_name}">
        <div class="card-body">
          <h5 class="card-title">${rice.rice_name}</h5>
          <p class="card-text">
            ${rice.rice_genre}<br>
            ${rice.rice_weight}kg<br>
            ${rice.rice_made}<br>
            ${rice.rice_since}<br>
            ${rice.rice_price}円<br>
          </p>
          <form action="/come/cart" method="post">
          		<button class="btn btn-primary">カートへ入れる</button>
          		<input type="hidden" name="rice_id" value="${rice.rice_id}">
          </form>
         </div>
      </div>
    </div>
  </c:forEach>
</div>


	<!-- いじるな -->
	<%@include file="../../assets/template/footer.jsp" %>