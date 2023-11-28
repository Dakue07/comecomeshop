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

<c:if test="${not empty userBean}">
    ${userBean.user_name}<br>
    ${userBean.user_id}<br>
</c:if>

<c:if test="${empty userBean}">
	ゆーざーないよ<br>
</c:if>


<%@include file="../../assets/template/slideshow.jsp" %>


<div class="row justify-content-center">
  <c:forEach var="data" items="${data}">
    <div class="col-md-auto mb-3 d-flex justify-content-center">
      <div class="card" style="width: 17rem;">
        <img src="${data.rice_image_path}" class="card-img-top" alt="${data.rice_name}">
        <div class="card-body">
          <h5 class="card-title">名前:${data.rice_name}</h5>
          <p class="card-text">
            種類:${data.rice_genre}<br>
            重さ:${data.rice_weight}kg<br>
            収穫地:${data.rice_made}<br>
            収穫日:${data.rice_since}<br>
            価格:${data.rice_price}円<br>
          </p>
          <form action = "<%= request.getContextPath() %>/come/cartInsert" method = post>
          	<button class="btn btn-primary">カートへ入れる</button>
          	<input type="hidden" name="rice_id" value="${data.rice_id}">
          </form>
         </div>
      </div>
    </div>
  </c:forEach>
</div>

<a href="<%=request.getContextPath() %>/come/cartInsert" class="btn btn-primary">カートへ入れる</a>


	<!-- いじるな -->
	<%@include file="../../assets/template/footer.jsp" %>