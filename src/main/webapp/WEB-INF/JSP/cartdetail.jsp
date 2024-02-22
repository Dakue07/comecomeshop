<HTML>
<head>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%@include file="../../assets/template/header2.jsp"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/cart.css">
</head>
<body>


	<!-- ここから下に書いてね -->

	<script src="/comecomeshop/JS/cart.js">
</script>

	<c:set var="totalPrice" value="0" />
	<div class="cart_card_wrap">

		<!-- カートの中身 -->
		<div id="cart" style="width: 48%;">

			<c:forEach var="data" items="${data}">
				<div class="card product_box">
					<div class="image_box">
						<img src="<%= request.getContextPath() %>${data.rice_image_path}"
							class="card-img-top, rice_img" alt="Product Image">
					</div>
					<div class="card-body">
						<h4 class="card-title">${data.rice_name}
							${data.rice_weight}kg</h4>
						<p class="card-text" style="margin: 0;">
							品目:${data.rice_genre}<br> <span class="rice-price">単価:<a
								id="rice-price-num">${data.rice_price}</a>円
							</span>
						</p>
					</div>

					<div>
						<c:set var="ricePrice"
							value="${data.rice_price * data.cart_quantity}" />
						<c:set var="totalPrice" value="${totalPrice + ricePrice}" />
						${totalPrice} 個数: <select class="mySelect"
							data-rice-stock="${data.rice_stock}"
							name="absolute_cart_quantity"
							onChange="selectPullDown(this, '${data.rice_id}');">
							<c:forEach var="i" begin="1" end="${data.rice_stock}">
								<option value="${i}"
									<c:if test="${i == data.cart_quantity}">
    					    	  	id="selected" selected
    					    	  </c:if>>
									${i}</option>
							</c:forEach>
						</select> 個<br> 小計:<span class="subtotal">${data.cart_quantity * data.rice_price}</span>円
						<form action="<%=request.getContextPath()%>/come/deleteCart"
							method="post" style="float: right;">
							<button class="btn btn-primary">削除</button>
							<input type="hidden" name="rice_id" value="${data.rice_id}">
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
		<div>

			<div class="card buy_box">
				<div class="card-body">
					<form id="purchaseForm"
						action="<%=request.getContextPath()%>/come/procedure"
						method="post">
						<!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
						合計金額：<span id="total" style="font-size: 1.5em; color: red;">${totalPrice}</span>円
						<button id="purchaseButton" class="btn btn-primary"
							style="width: 15rem; height: 5rem;">購入</button>
						<c:forEach var="data" items="${data}">
							<input type="hidden" name="cart_quantity_${data.rice_id}"
								value="${data.cart_quantity}">
						</c:forEach>
					</form>
				</div>
			</div>

		</div>
	</div>

	<script>
document.getElementById("purchaseButton").addEventListener("click", function(event) {
    if (${totalPrice} == 0) {
        event.preventDefault();
        window.location.href = "<%=request.getContextPath()%>/come/productlist";
    }
});
</script>



</body>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp"%>
</HTML>