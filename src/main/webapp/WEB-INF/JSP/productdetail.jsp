<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/productdetail.css">

<!DOCTYPE html>
<html>
<head>
<title>商品詳細</title>
<%@include file="../../assets/template/header2.jsp"%>
</head>
<body>
	<div class="product_container">
		<c:forEach var="data" items="${data[0]}">
			<div class="rice">
				<img class="rice_img"
					src="<%= request.getContextPath() %>${data.rice_image_path}"
					alt="${data.rice_name}">
			</div>

			<div class="product_info">
				<div class="product_name">${data.rice_name}</div>
				<div class="price_cart_box">
					<div class="product_price">価格:${data.rice_price}円</div>
					<div class="form_y">
						<form class="cart_button"
							action="<%=request.getContextPath()%>/come/addcart" method="post"
							onsubmit="return checkUserId()">
							<select class="mySelect" style="width: 53.6px;"
								data-rice-stock="${data.rice_stock}" name="cart_quantity">
								<c:forEach begin="1" end="${data.rice_stock}" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select> <input type="hidden" name="rice_id" value="${data.rice_id}">
							<button class="btn btn-primary">カートへ入れる</button>
						</form>
					</div>
				</div>

				<div class="product_genre">
					ジャンル:<strong>${data.rice_genre}</strong>
				</div>
				<div class="product_weight">
					重さ:<strong>${data.rice_weight}kg</strong>
				</div>
				<div class="product_made">生産地:${data.rice_made}</div>
				<div class="product_since">収穫日:${data.rice_since}月</div>
			</div>
			<c:if test="${data.rice_stock == 0}">
				<p style="color: red;">在庫がありません</p>
			</c:if>
		</c:forEach>

	</div>

	<div class="review">レビュー一覧</div>
	<br>
	<br>
	
	<c:forEach var="data" items="${data[1]}">
	<div class="review_box card">
	  <div class="card-body">
	    <h5 class="card-title">${data.user_name}</h5>
	    <h6 class="card-subtitle mb-2 text-body-secondary star">${data.review_star}</h6>
	    <p class="card-text">${data.review_comment}</p>
	    <c:if test="${userBean.user_id eq data.user_id}">
			<form action="<%=request.getContextPath()%>/come/deletereview"
				method="post">
				<input type="hidden" name="review_id" value="${data.review_id}">
				<input type="hidden" name="rice_id" value="${data.rice_id}">
				<input class="delete_btn" type="submit" value="削除"><br> <br>
			</form>
		</c:if>
	  </div>
	</div>
	</c:forEach>

	<script>
	 document.addEventListener("DOMContentLoaded", function() {
         var starElements = document.querySelectorAll(".star");
         starElements.forEach(function(starElement) {
             var reviewStar = parseInt(starElement.textContent);
             starElement.innerHTML = "";
             for (var i = 0; i < reviewStar; i++) {
                 var starSpan = document.createElement("span");
                 starSpan.innerHTML = "★";
                 starSpan.style.color = "gold";
                 starElement.appendChild(starSpan);
             }
         });
     });

		function checkUserId() {
			var user_id = "${userBean.user_id}";
			if (!user_id || user_id.trim() === "") {
				window.location.href = "<%=request.getContextPath()%>/signin";
				return false;
			}
			return true;
		}
	</script>

	<!-- フッター -->
	<%@include file="../../assets/template/footer.jsp"%>
</body>
</html>
