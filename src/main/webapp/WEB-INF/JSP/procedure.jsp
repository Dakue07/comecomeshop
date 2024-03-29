<html>
<head>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../../assets/template/header2.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/procedure.css">
<script src="<%=request.getContextPath()%>/JS/procedure.js"></script>
</head>

<h2>購入手続き</h2>
<br>

<c:set var="totalPrice" value="0" />

<div class="flex-area">
	<div id="fixed-area">
		<c:forEach var="data" items="${data[0]}">
			<div class="card card_wrap">
				<div>
					<img src="<%= request.getContextPath() %>${data.rice_image_path}"
						class="card-img-top rice_img" alt="Product Image">
				</div>

				<div class="card-body">
					<div>
						<h4 class="card-title">品種:${data.rice_name}
							${data.rice_weight} kg</h4>
					</div>
					<div>
						<c:set var="ricePrice"
							value="${data.rice_price * data.cart_quantity}" />
					</div>
					<div>
						<c:set var="totalPrice" value="${totalPrice + ricePrice}" />
					</div>


					<div class="card-text">
						品目:${data.rice_genre}<br> <span class="rice-price">単価:${data.rice_price}円</span><br>
						数量:${data.cart_quantity}個
					</div>
					<span class="subtotal">小計:${data.cart_quantity * data.rice_price}円</span>
				</div>
			</div>
		</c:forEach>
	</div>
	<!--右エリア-->

	<div class="procedure_buttons" id="purchaseContainer">
		<div>
			<form action="<%=request.getContextPath()%>/come/procedure"
				method="post">
				<div class="card"
					style="width: 18rem; margin-bottom: 70px; float: right;">
					<div class="card-body">
						<!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
						合計金額：<span id="total" style="font-size: 1.5em; color: red;">${totalPrice}</span>円
					</div>
				</div>
			</form>
		</div>

		<div>
			<form id="myForm" method="post">
				<a href="<%=request.getContextPath()%>/createpost"
					class="register2-link procedure_button">新しく住所を追加する</a>
			</form>
		</div>

		<div>
			<form id="myForm" method="post">
				<a href="<%=request.getContextPath()%>/come/card"
					class="register2-link procedure_button">新しく支払い方法を追加する</a>
			</form>
		</div>

		<div>
			<form action="<%=request.getContextPath()%>/come/addorderdetail"
				method="post">

				<div class="payment_btn procedure_button">
					<a type="button" onclick="openAddressModal()">住所選択</a> <input
						id="address-id" type="hidden" name="addressOption" checked>
				</div>

				<div class="payment_btn procedure_button">
					<a type="button" onclick="openPaymentModal()">支払い方法選択</a> <input
						id="payment-id" type="hidden" name="paymentOption" checked>
				</div>

				<div class="order_btn_area">
					<input type="submit" class="order_btn" id="ConfirmOrderBtn"
						value="注文確定">
				</div>


			</form>
		</div>
	</div>
</div>
<!--右固定エリア-->




<script>
	function toggleModal(modalType) {
		var modal = document.getElementById(modalType + '_modal');
		modal.style.display = (modal.style.display === 'flex') ? 'none'
				: 'flex';
	}
</script>
<div class="address-modal">
	<div class="address-modal-body">
		<div class="address-modal-close" onClick="closeAddressModal()">
			<div class="batsu">×</div>
		</div>
		<div class="address-list">
			<c:forEach var="data" items="${data[1]}">
				<div class="radio-group">
					<input type="radio" name="addressOption"
						value=${data.useraddress_id } checked onClick="chooseAddress()">
					<label> 受取人:${data.useraddress_receiver}<br>
						郵便番号:${data.useraddress_postcode}<br>
						都道府県:${data.useraddress_state_city}<br>
						市町村:${data.useraddress_street}<br>
					</label>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="payment-modal">
	<div class="payment-modal-body">
		<div class="payment-modal-close" onClick="closePaymentModal()">
			<div class="batsu">×</div>
		</div>
		<div class="payment-list">
			<c:forEach var="data" items="${data[2]}">
				<div class="radio-group">
					<input type="radio" name="paymentOption" value=${data.card_id }
						checked onClick="choosePayment()"> <label>
						カード番号:${data.card_replace_number}<br>
						カード名義人:${data.card_holdername}<br> 有効期限:${data.card_validity}<br>
					</label>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@include file="../../assets/template/footer.jsp"%>

</html>
