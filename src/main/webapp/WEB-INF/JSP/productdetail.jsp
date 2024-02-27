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
	<div>
		商品詳細
		<c:forEach var="data" items="${data[0]}">
			<br>
			<img class="rice_img"
				src="<%= request.getContextPath() %>${data.rice_image_path}"
				alt="${data.rice_name}">
			<br>名前:${data.rice_name}<br>値段:${data.rice_price}円<br>ジャンル:${data.rice_genre}<br>重さ:${data.rice_weight}kg<br>生産地:${data.rice_made}<br>収穫日:${data.rice_since}月
			<form class="cart_button"
				action="<%=request.getContextPath()%>/come/addcart" method="post"
				onsubmit="return checkUserId()">
				<select class="mySelect" style="width: 53.6px;"
					data-rice-stock="${data.rice_stock}" name="cart_quantity">
					<c:forEach begin="1" end="${data.rice_stock}" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
				<input type="hidden" name="rice_id" value="${data.rice_id}">
				<button class="btn btn-primary">カートへ入れる</button>
			</form>
			<c:if test="${data.rice_stock == 0}">
				<p style="color: red;">在庫がありません</p>
			</c:if>
		</c:forEach>
		レビュー一覧<br> <br>
		<c:forEach var="data" items="${data[1]}">
        	${data.user_name}
            <div class="star">${data.review_star}</div>
            ${data.review_comment}<br>
			<br>

			<c:if test="${userBean.user_id eq data.user_id}">
				<form action="<%=request.getContextPath()%>/come/deletereview"
					method="post">
					<input type="hidden" name="review_id" value="${data.review_id}">
					<input type="hidden" name="rice_id" value="${data.rice_id}">
					<input type="submit" value="削除"><br> <br>
				</form>
			</c:if>
		</c:forEach>
	</div>

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
