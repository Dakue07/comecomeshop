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
		<div id="cart" class="cart">

			<%@include file="./cartdetail.jsp"%>
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
</body>

<!-- いじるな -->
<%@include file="../../assets/template/footer.jsp"%>
</HTML>