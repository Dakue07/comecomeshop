<HTML>
<head>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../../assets/template/header2.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/procedure.css">
</head>
<body>
<h2>購入手続き</h2>
<br>

<c:set var="totalPrice" value="0" />

<c:forEach var="data" items="${data[0]}">
	<div class="card" style="width: 40rem; margin-bottom: 10px;">
		<img src="<%= request.getContextPath() %>${data.rice_image_path}"
			class="card-img-top" alt="Product Image">
		<div class="card-body">
			<h4 class="card-title">品種:${data.rice_name} ${data.rice_weight} kg</h4>
			<c:set var="ricePrice"
				value="${data.rice_price * data.cart_quantity}" />
			<c:set var="totalPrice" value="${totalPrice + ricePrice}" />
			<div class="card-text">
				品目:${data.rice_genre}<br>
				<span class="rice-price">単価:${data.rice_price}円</span><br>
				数量:${data.cart_quantity}個
			</div>
			<span class="subtotal">小計:${data.cart_quantity * data.rice_price}円</span>
		</div>
	</div>
</c:forEach>

<div id="purchaseContainer" style="margin-top: 120px;">
	<form action="<%=request.getContextPath()%>/come/procedure" method="post">
		<div class="card"
			style="width: 18rem; margin-bottom: 70px; float: right;">
			<div class="card-body">
				<!-- 合計金額のフォントサイズを大きくし、色を赤に変更 -->
				合計金額：<span id="total" style="font-size: 1.5em; color: red;">${totalPrice}</span>円
			</div>
		</div>
	</form>
	
	<form action="<%=request.getContextPath()%>/createpost" method="post">
		<input type="hidden" name="url" value="/createpost">
		<button type="submit" class="register2-link">新しく住所を登録する</button>
	</form>
	
	<form action="<%=request.getContextPath()%>/come/card" method="post">
		<input type="hidden" name="url" value="/come/card">
		<button type="submit" class="register2-link">新しく支払い方法を追加する</button>
	</form>

	<form action="<%=request.getContextPath()%>/come/addorderdetail" method="post">
		<button type="button" onclick="toggleModal('address')"
			style="position: absolute; left: 20%;">住所選択</button>
		<br>
		<div id="address_modal" class="modal-container">
			<div class="modal-content">
				<span class="close-btn" onclick="toggleModal('address')">&times;</span>
				<c:forEach var="data" items="${data[1]}">
					<div class="radio-group">
						<input type="radio" name="addressOption"
							value=${data.useraddress_id } checked>
						<label>
							受取人:${data.useraddress_receiver}<br>
							郵便番号:${data.useraddress_postcode}<br>
							都道府県:${data.useraddress_state_city}<br>
							市町村:${data.useraddress_street}<br>
						</label>
					</div>
				</c:forEach>
			</div>
		</div>

		<button type="button" onclick="toggleModal('payment')"
		style="position: relative;">支払い方法選択</button>
		<br>
	
		<div id="payment_modal" class="modal-container">
			<div class="modal-content">
				<span class="close-btn" onclick="toggleModal('payment')">&times;</span>
				<c:forEach var="data" items="${data[2]}">
					<div class="radio-group">
					<input type="radio" name="paymentOption"
						value=${data.card_id} checked>
					カード番号:${data.card_replace_number}<br>
					カード名義人:${data.card_holdername}<br> 有効期限:${data.card_validity}<br>
					</div>
				</c:forEach>
			</div>
		</div>

		<input type="submit" id="ConfirmOrderBtn" value="注文確定"
			style="position: absolute; right: 20%; height: 50px;">
	</form>
</div>
<script>
	function toggleModal(modalType) {
    var modal = document.getElementById(modalType + '_modal');
    modal.style.display = (modal.style.display === 'flex') ? 'none' : 'flex';
	}
</script>
<%@include file="../../assets/template/footer.jsp"%>
</body>
</HTML>